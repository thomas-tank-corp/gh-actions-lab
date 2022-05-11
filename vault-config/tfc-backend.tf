// resource "vault_terraform_cloud_secret_backend" "workshop" {
//   description = "Manages the Terraform Cloud backend"
//   default_lease_ttl_seconds = "120"
//   token       = var.tfc_team_token
// }

// resource "vault_terraform_cloud_secret_role" "example" {
//   backend      = vault_terraform_cloud_secret_backend.workshop
//   name         = "workshop"
//   organization = var.tfc_org_name
//   team_id      = var.tfc_team_id
// }