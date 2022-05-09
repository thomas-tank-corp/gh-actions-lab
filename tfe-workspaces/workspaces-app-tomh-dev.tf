module "workspace_tom_dev" {
  source  = "app.terraform.io/tom-se-hashi/workspace-module/tfe"
  version = "0.0.3"
  workspace_oauth_id = var.workspace_oauth_id
  organization = "tom-se-hashi"
  workspace_name = "workshop-tom-app"
  workspace_owner_email = "tharris@hashicorp.com"
  workspace_vcs_identifier = "tom-se-workshop/tom-gh"
  workspace_tags = ["workshop-dev"]
}
  
module "repo-module" {
  source  = "app.terraform.io/tom-se-hashi/repo-module/github"
  version = "0.0.3"
  name = "workshop-tom-app"
}  

# module "auth-module" {
#   source  = "app.terraform.io/tom-se-hashi/auth-module/github"
#   version = "0.0.2"
#   repo_name = "workshop-tom-app"
#   username = "thomas-tank-corp"
# }
