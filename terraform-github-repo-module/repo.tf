resource "github_repository" "github_repo" {
  name        = var.github_repo_name
  description = var.description
  visibility = "private"
  auto_init = true

}

