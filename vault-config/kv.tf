resource "vault_mount" "kv" {
  path        = "kv/tfe"
  type        = "kv"
}
