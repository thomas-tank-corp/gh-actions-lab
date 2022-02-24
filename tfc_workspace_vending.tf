resource "tfe_workspace" "vending" {
  name         = "workshop-tfc-vending-workspace"
  organization = var.tfc_org_name
  queue_all_runs = false
  tag_names         = ["workshop"]
  vcs_repo {
    identifier = "${var.github_org}/${var.github_vending_repo_name}"
    oauth_token_id = tfe_oauth_client.workshop-oauth.oauth_token_id
  }
  depends_on = [github_repository.vending_repo]
}

resource "tfe_team_access" "vending" {
  team_id      = tfe_team.workshop.id
  workspace_id = tfe_workspace.vending.id
  permissions {
    runs              = "apply"
    variables         = "write"
    state_versions    = "write"
    sentinel_mocks    = "read"
    workspace_locking = true
  }
}

resource "tfe_variable" "tfc_token_vending" {
  key          = "token"
  value        = var.tfc_org_token
  category     = "terraform"
  workspace_id = tfe_workspace.vending.id
  sensitive    = "true"
  description  = "TFC org token"
}

resource "tfe_variable" "tfc_org_name" {
  key          = "tfc_org_name"
  value        = var.tfc_org_name
  category     = "terraform"
  workspace_id = tfe_workspace.vending.id
  sensitive    = "false"
}

resource "tfe_variable" "github_org_creds" {
  key          = "github_org"
  value        = var.github_org
  category     = "terraform"
  workspace_id = tfe_workspace.vending.id
  sensitive    = "false"
}







