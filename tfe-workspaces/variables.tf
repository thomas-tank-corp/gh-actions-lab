variable "token" {
    description = "token with org wide permissions to create workspaces"
}

variable "hostname" {
    description = "TFE hostname"
    default = "app.terraform.io"
}

// variable "gcp_creds" {
//     description = "GCP service account"
// }


variable "tfc_org_name" {}

variable "workspace_oauth_id" {}