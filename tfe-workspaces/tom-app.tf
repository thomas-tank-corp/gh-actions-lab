module "tom-repo" {
  source  = "app.terraform.io/tom-se-hashi/repo-module/github"
  version = "0.0.2"
  name = "tom-app-dev"
}  

module "tom-workspace" {
  source  = "app.terraform.io/tom-se-hashi/workspace-module/tfe"
  depends_on = [module.tom-repo]
  version = "0.0.2"
  workspace_oauth_id = var.workspace_oauth_id
  organization = "tom-se-hashi"
  workspace_name = "tom-app-dev"
  workspace_owner_email = "tharris@hashicorp.com"
  workspace_vcs_identifier = "tom-se-workshop/tom-app-dev"
  workspace_tags = ["workshop-dev"]
}


module "tom-auth" {
  source  = "app.terraform.io/tom-se-hashi/auth-module/github"
  version = "0.0.1"
  repo_name = "tom-se-workshop/tom-app-dev"
  username = "thomas-tank-corp"
}
