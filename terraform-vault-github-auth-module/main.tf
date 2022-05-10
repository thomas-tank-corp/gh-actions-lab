variable "username" {
  description = "github username"
}

variable "repo_name" {
  description = "name of the github repository to authenticate from"
} 

resource "vault_jwt_auth_backend" "workshop" {
description = "oidc auth backend for github actions"
path = "github_jwt_${var.username}"
oidc_discovery_url="https://token.actions.githubusercontent.com"
bound_issuer="https://token.actions.githubusercontent.com"
default_role="demo"
tune {
    listing_visibility = "unauth"
    default_lease_ttl  = "12h"
    max_lease_ttl      = "24h"
    token_type         = "default-service"
  }
}

resource "vault_jwt_auth_backend_role" "workshop"{
    backend = vault_jwt_auth_backend.workshop.path
    role_type = "jwt"
    role_name = "workshop"
    token_policies = ["default", "hcp-root"]
    bound_claims = {
         "sub" = "repo:${var.repo_name}:ref:refs/*"
    }
    bound_subject = ""
    bound_audiences = ["https://github.com/${var.username}"]
    user_claim = "workflow"

}