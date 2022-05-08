resource "tfe_workspace" "vault-config" {
  name         = "workshop-vault-config"
  organization = var.tfc_org_name
  queue_all_runs = false
  tag_names         = ["workshop"]
  vcs_repo {
    identifier = "${var.github_org}/${var.github_vault_config_repo_name}"
    oauth_token_id = tfe_oauth_client.workshop-oauth.oauth_token_id
  }
  depends_on = [github_repository.vault-config]
}

resource "tfe_run_trigger" "vault" {
  workspace_id  = tfe_workspace.vault-config.id
  sourceable_id = tfe_workspace.hcp-vault.id
}

resource "tfe_team_access" "vault-config" {
  team_id      = tfe_team.workshop.id
  workspace_id = tfe_workspace.vault-config.id
  permissions {current
    runs              = "apply"
    variables         = "write"
    state_versions    = "write"
    sentinel_mocks    = "read"
    workspace_locking = true
  }
}


resource "tfe_variable" "tfc_org" {
  key          = "tfc_org_name"
  value        = var.tfc_org_name
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "TFC Org"
}


resource "tfe_variable" "tfc_token" {
  key          = "tfc_team_token"
  value        = tfe_team_token.workshop.token
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "TFC Team token"
  sensitive    = "true"
}

resource "tfe_variable" "github_org" {
  key          = "github_org"
  value        = var.github_org
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "github org name"
  sensitive    = "false"
}

resource "tfe_variable" "github_team" {
  key          = "github_team_name"
  value        = var.github_team_name
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "github team name"
  sensitive    = "false"
}

resource "tfe_variable" "tfc_team_id" {
  key          = "HCP_CLIENT_ID"
  value        = var.hcp_client_id
  category     = "env"
  workspace_id = tfe_workspace.hcp-vault.id
  description  = "HCP Client ID"
  sensitive    = "true"
}


resource "tfe_variable" "secret" {
  key          = "HCP_CLIENT_SECRET"
  value        = var.hcp_client_secret
  category     = "env"
  workspace_id = tfe_workspace.hcp-vault.id
  description  = "HCP Client Secret"
  sensitive    = "true"
}

resource "tfe_variable" "GCP_project" {
  key          = "GCP_project"
  value        = var.GCP_project
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "GCP project"
  sensitive    = "false"
}

resource "tfe_variable" "GCP_SA" {
  key          = "GCP_SA"
  value        = var.GCP_SA
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "GCP Service account for GCP secrets backend"
  sensitive    = "true"
}

resource "tfe_variable" "github_membership" {
  key          = "github_membership"
  value        = jsonencode(var.github_membership)
  category     = "terraform"
  workspace_id = tfe_workspace.vault-config.id
  description  = "Entity for Github users"
  sensitive    = "false"
  hcl          = "true"
}