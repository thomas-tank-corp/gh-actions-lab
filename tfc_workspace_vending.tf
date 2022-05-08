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

resource "tfe_variable" "github_org" {
  key          = "GITHUB_ORGANIZATION"
  value        = var.github_org
  category     = "env"
  workspace_id = tfe_workspace.vending.id
  sensitive    = "false"
}

resource "tfe_variable" "github_creds" {
  key          = "GITHUB_TOKEN"
  value        = var.github_token
  category     = "env"
  workspace_id = tfe_workspace.vending.id
  sensitive    = ""
}

resource "tfe_variable" "oauth" {
  key          = "workspace_oauth_id"
  value        = tfe_oauth_client.workshop-oauth.oauth_token_id
  category     = "terraform"
  workspace_id = tfe_workspace.vending.id
  sensitive    = "true"
}

resource "tfe_variable" "id" {
  key          = "HCP_CLIENT_ID"
  value        = var.hcp_client_id
  category     = "env"
  workspace_id = tfe_workspace.vending.id
  description  = "HCP Client ID"
  sensitive    = "true"
}


resource "tfe_variable" "secret" {
  key          = "HCP_CLIENT_SECRET"
  value        = var.hcp_client_secret
  category     = "env"
  workspace_id = tfe_workspace.vending.id
  description  = "HCP Client Secret"
  sensitive    = "true"
}

# resource "tfe_variable" "VAULT_ADDR" {
#   key          = "VAULT_ADDR"
#   value        = data.terraform_remote_state.hcp.outputs.VAULT_ADDR
#   category     = "env"
#   workspace_id = tfe_workspace.vending.id
#   description  = "Vault Address"
#   sensitive    = "false"
# }

# resource "tfe_variable" "VAULT_TOKEN" {
#   key          = "VAULT_TOKEN"
#   value        = data.terraform_remote_state.hcp.outputs.VAULT_TOKEN
#   category     = "env"
#   workspace_id = tfe_workspace.vending.id
#   description  = "Vault token"
#   sensitive    = "false"
# }










