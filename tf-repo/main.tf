terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.42.0"
    }
  }
}

resource "github_repository" "repo" {
  name        = var.name
  description = var.description

  visibility             = var.visibility
  delete_branch_on_merge = true
  auto_init              = true
  has_issues             = true
  allow_auto_merge       = true
  allow_rebase_merge     = false
  license_template       = var.license
  vulnerability_alerts   = true
  dynamic "template" {
    for_each = var.template ? [1] : []
    content {
      owner      = var.template_owner
      repository = var.template_repository
    }
  }
  #allow_update_branch     = true

  security_and_analysis {
    dynamic "advanced_security" {
      for_each = var.visibility == "public" ? [] : [1]
      content {
        status = "enabled"
      }
    }

    secret_scanning {
      status = "disabled"
    }

    secret_scanning_push_protection {
      status = "disabled"
    }
  }
}

resource "github_branch_protection" "repo" {
  repository_id = github_repository.repo.node_id

  pattern                = "main"
  enforce_admins         = false
  allows_force_pushes    = true
  require_signed_commits = true

  required_status_checks {
    strict = false
    contexts = [
      "commitlint",
      "build",
      "terrascan"
    ]
  }
  required_pull_request_reviews {
    require_code_owner_reviews = true
    dismiss_stale_reviews      = true
  }
}
