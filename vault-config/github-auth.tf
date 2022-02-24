resource "vault_github_auth_backend" "workshop" {
  organization = var.github_org
}

resource "vault_github_team" "workshop" {
  backend  = vault_github_auth_backend.workshop.id
  team     = var.github_team_name
  policies = ["hcp-root"]
}

resource "vault_identity_entity" "workshop" {
  for_each = toset(var.github_membership)
  name      = each.key
  policies  = ["hcp-root"]
}

// resource "vault_identity_entity_alias" "app" {
//   for_each = toset(var.github_membership)
//   name            = each.key
//   mount_accessor  = vault_github_auth_backend.workshop.accessor
//   canonical_id    = vault_identity_entity.workshop[each.value]
// }
