resource "github_repository" "github_repo" {
  name        = var.name
  description = var.description
  visibility = "private"
  auto_init = true
  template {
    owner = "tom-se-hashi"
    repository = "github-actions-template"
  }
}
