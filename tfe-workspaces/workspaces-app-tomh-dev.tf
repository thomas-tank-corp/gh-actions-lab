module "workspace_tom_dev" {
  source  = "app.terraform.io/tom-se-hashi/workspace-module/tfe"
  version = "0.0.5"
  workspace_oauth_id = var.workspace_oauth_id
  organization = "tom-se-hashi"
  workspace_name = "workshop-tom-dev"
  workspace_owner_email = "tharris@hashicorp.com"
  workspace_vcs_identifier = "tom-se-workshop/tom-gh"
  workspace_tags = ["workshop-dev"]
}