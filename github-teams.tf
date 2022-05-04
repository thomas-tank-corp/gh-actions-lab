resource "github_team" "workshop" {
  name        = var.workshop_team
  description = "cool team"
}

resource "github_team_membership" "workshop" {
  for_each = toset(var.github_membership)
  team_id  = github_team.workshop.id
  username = each.key
  role     = "maintainer"
}

resource "github_team_repository" "vending_repo" {
  team_id    = github_team.workshop.id
  repository = github_repository.vending_repo.name
  permission = "admin"
}

resource "github_team_repository" "github_actions" {
  team_id    = github_team.workshop.id
  repository = github_repository.github_actions.name
  permission = "admin"
}

resource "github_team_repository" "github_create_repo" {
  team_id    = github_team.workshop.id
  repository = github_repository.github_create_repo.name
  permission = "admin"
}
