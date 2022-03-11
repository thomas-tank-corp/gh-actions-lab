resource "vault_mount" "kv" {
  path        = "kv/tfe"
  type        = "kv"
}


resource "vault_generic_secret" "tfe_token" {
  path = "kv/tfe"

  data_json = jsonencode({
   TFE_TOKEN = tokenewhvbasdohashdjkbasdjabds f
  })
}

