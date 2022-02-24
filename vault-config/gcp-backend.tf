resource "vault_gcp_secret_backend" "gcp" {
  credentials = var.GCP_SA
  path = "gcp"
  default_lease_ttl_seconds = "60"
  max_lease_ttl_seconds = "120"
}

resource "vault_gcp_secret_roleset" "roleset" {
  backend      = vault_gcp_secret_backend.gcp.path
  roleset      = "project_owner"
  secret_type  = "service_account_key"
  project      = var.GCP_project
  token_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

  binding {
    resource = "//cloudresourcemanager.googleapis.com/projects/${var.GCP_project}"

    roles = [
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser",
    "roles/viewer"
    ]
  }
}