terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.9.0"
    }
  }
}

provider "hcp" {}


resource "hcp_hvn" "workshop" {
  hvn_id         = "workshop"
  cloud_provider = "aws"
  region         = "eu-central-1"
  cidr_block     = "172.30.16.0/20"
}

resource "hcp_vault_cluster" "workshop" {
  cluster_id = "workshop-cluster"
  hvn_id     = hcp_hvn.workshop.hvn_id
  public_endpoint = true
  tier = "dev"
}

resource "hcp_vault_cluster_admin_token" "workshop" {
  cluster_id = hcp_vault_cluster.workshop.cluster_id
}

output "VAULT_TOKEN" {
  value = hcp_vault_cluster_admin_token.workshop.token
  sensitive = true
}


output "VAULT_ADDR" {
  value = hcp_vault_cluster.workshop.vault_public_endpoint_url
  sensitive = false
}




