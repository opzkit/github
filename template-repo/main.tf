terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
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
  is_template            = true
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
      "commitlint"
    ]
  }
  required_pull_request_reviews {
    require_code_owner_reviews = true
    dismiss_stale_reviews      = true
  }
}

resource "github_repository_file" "files" {
  for_each       = toset(["CODEOWNERS", "Makefile", ".gitignore"])
  repository     = github_repository.repo.name
  branch         = "main"
  file           = each.key
  content        = file("${path.module}/template/${each.key}")
  commit_message = "chore: update ${each.key}"
}

resource "github_repository_file" "examples" {
  repository     = github_repository.repo.name
  branch         = "main"
  file           = "examples/.gitkeep"
  content        = ""
  commit_message = "chore: update examples"
}

resource "github_repository_file" "github" {
  for_each       = fileset(path.root, ".github/**/")
  repository     = github_repository.repo.name
  branch         = "main"
  file           = each.key
  content        = file("${path.root}/${each.key}")
  commit_message = "chore: update ${each.key}"
}
