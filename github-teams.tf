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

