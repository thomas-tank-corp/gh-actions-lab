resource "github_repository" "github_repo" {
  name        = var.name
  description = var.description
  visibility = "private"
  auto_init = true
  template {
    owner = "tom-se-workshop"
    repository = "github-actions-template"
  }
}
