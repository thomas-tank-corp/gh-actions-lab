terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.26.1"
    }
    github = {
      source = "integrations/github"
      version = "4.18.0"
    }
  }
}

provider "tfe" {}


provider "github" {
    owner = var.github_org
}




