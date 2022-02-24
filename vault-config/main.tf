terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "2.21.0"
    }
  }
}


provider "vault" {
  address = data.terraform_remote_state.hcp.outputs.VAULT_ADDR
  token = data.terraform_remote_state.hcp.outputs.VAULT_TOKEN
}

data "terraform_remote_state" "hcp" {
  backend = "remote"

  config = {
    organization = var.tfc_org_name
    workspaces = {
      name = "workshop-hcp-vault"
    }
  }
}




