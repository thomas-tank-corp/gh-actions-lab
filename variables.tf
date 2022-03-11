variable "github_org" {}

variable "github_membership" {}

variable "tfc_invite" {}

variable "github_team_name" {}

variable "tfc_org_name" {}

variable "GCP_SA" {}

variable "tfc_org_token" {}

variable "hcp_client_id" {}

variable "hcp_client_secret" {}

variable "github_token" {}

variable "tfc_email" {}

variable "GCP_project" {}

variable "workshop_team" {
    default = "workshop_team"
}

variable "github_vending_repo_name" {
    default = "terraform_workshop_workspaces"
}

variable "github_hcp_vault_repo_name" {
    default = "terraform_workshop_hcp_vault"
}

variable "github_vault_config_repo_name" {
    default = "terraform_workshop_vault_config"
}

variable "github_actions_repo_name" {
    default = "terraform_workshop_github_actions"
}

