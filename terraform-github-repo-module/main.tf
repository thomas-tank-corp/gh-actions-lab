terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.18.0"
    }
  }
}

provider "github" {}