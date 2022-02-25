# terraform-tfe-onboarding

# terraform-tfe-onboarding

module "workspace-A" {
  source  = "app.terraform.io/tom-se-hashi/onboarding/tfe"
  version = "0.0.1"

  # Workspace setup
  organization             = "tom-se-hashi"
  workspace_name           = "onboarding_test"
  workspace_owner_email    = "tharris@hashicorp.com"
  workspace_description    = "Onboarding test"
  workspace_vcs_identifier = "thomas-tank-corp/gcp-instance-example"
  workspace_oauth_id       = var.workspace_oauth_id
  workspace_tags           = [
    "teamA",
    "onboarding",
    ]

  # Variables
  variables = {
    admin_password = {
      value       = "P@ssw0rd"
      description = "Secure access to nothing"
      sensitive   = true
    }
  }

  # RBAC
  # Optional built-in RBAC teams
  ## Read
  workspace_read_access_emails = [
    "tharris@hashicorp.com"
  ]

  ## Write
  workspace_write_access_emails = [
    "tharris@hashicorp.com"
  ]

  ## Plan
  workspace_plan_access_emails = [
    "tharris@hashicorp.com"
  ]
}