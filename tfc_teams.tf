// resource "tfe_team_organization_member" "workshop" {
//   team_id = tfe_team.workshop.id
//   organization_membership_id = tfe_organization_membership.workshop.id
// }

// data "tfe_organization_membership" "workshop" {
//   for_each = toset(var.tfc_invite)
//   organization  = var.tfc_org_name
//   email = each.key
// }

// resource "tfe_team_members" "test" {
//   team_id   = tfe_team.workshop.id
//   usernames = data.tfe_organization_membership.workshop[0].user_id
// }