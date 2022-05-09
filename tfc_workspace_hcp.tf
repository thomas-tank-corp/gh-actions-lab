resource "tfe_workspace" "hcp-vault" {
  name         = "workshop-hcp-vault"
  organization = var.tfc_org_name
  global_remote_state = true
  tag_names         = ["workshop"]
  vcs_repo {
    identifier = "${var.github_org}/${var.github_hcp_vault_repo_name}"
    oauth_token_id = tfe_oauth_client.workshop-oauth.oauth_token_id
  }
  depends_on = [github_repository.hcp-vault]
}

resource "tfe_team_access" "hcp-vault" {
  team_id      = tfe_team.workshop.id
  workspace_id = tfe_workspace.hcp-vault.id
  permissions {
    runs              = "apply"
    variables         = "write"
    state_versions    = "write"
    sentinel_mocks    = "read"
    workspace_locking = true
  }
}

resource "tfe_variable" "hcp_id_hcp_ws" {
  key          = "HCP_CLIENT_ID"
  value        = var.hcp_client_id
  category     = "env"
  workspace_id = tfe_workspace.hcp-vault.id
  description  = "HCP Client ID"
  sensitive    = "true"
}


resource "tfe_variable" "hcp_secret_hcp_ws" {
  key          = "HCP_CLIENT_SECRET"
  value        = var.hcp_client_secret
  category     = "env"
  workspace_id = tfe_workspace.hcp-vault.id
  description  = "HCP Client Secret"
  sensitive    = "true"
}



