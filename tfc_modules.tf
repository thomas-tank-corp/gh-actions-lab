resource "tfe_registry_module" "terraform-tfe-workspace-module" {
  vcs_repo {
    display_identifier = "${var.github_org}/terraform-tfc-workspace-module"
    identifier         = "${var.github_org}/terraform-tfc-workspace-module"
    oauth_token_id     = tfe_oauth_client.workshop-oauth.oauth_token_id
  }
}

resource "tfe_registry_module" "terraform-github-repo-module" {
  vcs_repo {
    display_identifier = "${var.github_org}/terraform-github-repo-module"
    identifier         = "${var.github_org}/terraform-github-repo-module"
    oauth_token_id     = tfe_oauth_client.workshop-oauth.oauth_token_id
  }
}

