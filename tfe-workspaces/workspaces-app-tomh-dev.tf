module "teams" {}



module "workspace_tom_dev" {
  source  = "app.terraform.io/tom-se-hashi/workspace-module/tfc"
  version = "0.0.1"

  organization = "tom-se-hashi"
  workspace_name = "workshop-tom-dev"
  workspace_owner_email = "tharris@hashicorp.com"
  workspace_vcs_identifier = "tom-test-hashi/tom-dev"
  workspace_tags = ["workshop-dev"]
}



module "workspace_tom_prod" {
  source  = "app.terraform.io/tom-se-hashi/workspace-module/tfc"
  version = "0.0.1"

  organization = "tom-se-hashi"
  workspace_name = "workshop-tom-prod"
  workspace_owner_email = "tharris@hashicorp.com"
  workspace_vcs_identifier = "tom-test-hashi/tom-dev"
  workspace_tags = ["workshop-prod"]

  variables = {
    environment = {
      value = "development"
    }

    region = {
      value       = "eu-west2"
      description = "GCP region to deploy into"
    }
}



