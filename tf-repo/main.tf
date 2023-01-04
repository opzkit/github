terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.13.0"
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
  #  template {
  #    owner      = var.template_owner
  #    repository = var.template_repository
  #  }
  #allow_update_branch     = true
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
