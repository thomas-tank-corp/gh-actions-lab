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
  }
}

provider "tfe" {
  hostname = var.hostname
  token    = var.token
}


