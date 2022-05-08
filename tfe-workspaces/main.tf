terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "tom-se-hashi"

    workspaces {
      name = "workshop-tfc-vending-workspace"
    }
  }
}


terraform {
  required_providers {
    tfe = {
      version = "~> 0.26.1"
    }
    github = {
      source = "integrations/github"
      version = "4.25.0-alpha"
    }
    hcp = {
      source = "hashicorp/hcp"
      version = "0.9.0"
    }
  }
}

provider "github" {}

provider "hcp" {}

provider "tfe" {
  hostname = var.hostname
  token    = var.token
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






