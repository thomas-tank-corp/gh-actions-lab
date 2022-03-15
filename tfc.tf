// resource "tfe_organization" "workshop" {
//   name  = var.tfc_org_name
//   email = var.tfc_email
// }

// resource "tfe_organization_token" "workshop" {
//   organization = var.tfc_org_name
// }

resource "tfe_oauth_client" "workshop-oauth" {
  organization     = var.tfc_org_name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      =  var.github_token
  service_provider = "github"
}


resource "tfe_organization_membership" "workshop" {
  for_each = toset(var.tfc_invite)
  organization  = var.tfc_org_name
  email = each.key
}


resource "tfe_team" "workshop" {
  name         = "workshop-team"
  organization = var.tfc_org_name
}

resource "tfe_team_organization_member" "workshop" {
  team_id = tfe_team.workshop.id
  organization_membership_id = tfe_organization_membership.workshop[0].id
}

resource "tfe_team_token" "workshop" {
  team_id = tfe_team.workshop.id
}

output "TFE_TOKEN" {
  value = tfe_team_token.workshop.id
  sensitive = true
}