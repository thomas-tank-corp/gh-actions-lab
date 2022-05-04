// resource "github_membership" "workshop" {
//  for_each = toset(var.github_membership)
//   username = each.key
//   role     = "member"
// }


resource "github_repository" "vending_repo" {
  name        = var.github_vending_repo_name
  description = "TFC Workspace Vending Repo"
  visibility = "private"
  auto_init = true

}

resource "github_repository_file" "vending-main" {
  repository          = github_repository.vending_repo.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/tfe-workspaces/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true

  depends_on = [github_repository.vending_repo]
}

resource "github_repository_file" "variables" {
  repository          = github_repository.vending_repo.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("${path.module}/tfe-workspaces/variables.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vending_repo]
}


resource "github_repository_file" "workspace-dev" {
  repository          = github_repository.vending_repo.name
  branch              = "main"
  file                = "workspaces-app-tomh-dev.tf"
  content             = file("${path.module}/tfe-workspaces/workspaces-app-tomh-dev.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vending_repo]
}

resource "github_repository_file" "workspace-prod" {
  repository          = github_repository.vending_repo.name
  branch              = "main"
  file                = "workspaces-app-tomh-prod"
  content             = file("${path.module}/tfe-workspaces/workspaces-app-tomh-prod.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vending_repo]
}


resource "github_repository" "hcp-vault" {
  name        = var.github_hcp_vault_repo_name
  description = "HCP vault"
  visibility = "private"
  auto_init = true

}

resource "github_repository_file" "hcp-vault-main" {
  repository          = github_repository.hcp-vault.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/hcp-vault/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.hcp-vault]
}

resource "github_repository" "vault-config" {
  name        = var.github_vault_config_repo_name
  description = "HCP vault"
  visibility = "private"
  auto_init = true

}

resource "github_repository_file" "vault-config" {
  repository          = github_repository.vault-config.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/vault-config/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vault-config]
}

resource "github_repository_file" "gcp-backend" {
  repository          = github_repository.vault-config.name
  branch              = "main"
  file                = "gcp-backend.tf"
  content             = file("${path.module}/vault-config/gcp-backend.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vault-config]
}

resource "github_repository_file" "gcp-auth" {
  repository          = github_repository.vault-config.name
  branch              = "main"
  file                = "github-auth.tf"
  content             = file("${path.module}/vault-config/github-auth.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vault-config]
}

resource "github_repository_file" "vault-config-vars" {
  repository          = github_repository.vault-config.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("${path.module}/vault-config/variables.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on = [github_repository.vault-config]
}



resource "github_repository" "github_actions" {
  name        = var.github_actions_repo_name
  description = "github actions"
  visibility = "private"
  auto_init = true
  is_template = true

}

resource "github_repository_file" "main_actions" {
  repository          = github_repository.github_actions.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/github-actions-tfc/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "main-yml" {
  repository          = github_repository.github_actions.name
  branch              = "main"
  file                = ".github/workflows"
  content             = file("${path.module}/github-actions-tfc/.github/workflows/main.yml")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

// resource "github_repository_file" "main" {
//   repository          = github_repository.github_actions.name
//   branch              = "main"
//   file                = ""
//   content             = file("${path.module}/github-actions-tfc/.tf")
//   commit_message      = "Managed by Terraform"
//   commit_author       = "Terraform User"
//   commit_email        = "terraform@example.com"
//   overwrite_on_create = true
// }

/////////  Module

resource "github_repository" "terraform-tfe-workspace-module" {
  name        = "terraform-tfe-workspace-module"
  description = "TFC Workspace Vending Repo"
  visibility = "private"
  auto_init = true

}

// resource "github_repository_file" "main" {
//   repository          = github_repository.terraform-tfe-workspace-module.name
//   branch              = "main"
//   file                = ""
//   content             = file("${path.module}/terraform-tfe-workspace-module/.tf")
//   commit_message      = "Managed by Terraform"
//   commit_author       = "Terraform User"
//   commit_email        = "terraform@example.com"
//   overwrite_on_create = true
// }
//
resource "github_repository_file" "mwas-pt-main" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "modules/policy_by_tag/main.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/modules/policy_by_tag/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "was-pt-outputs" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "modules/policy_by_tag/outputs.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/modules/policy_by_tag/outputs.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "ws-pt-vars" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "modules/policy_by_tag/variables.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/modules/policy_by_tag/outputs.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "was-rbac-variables" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "modules/rbac_user/variables.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/modules/rbac_user/variables.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "ws-rbac-main" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "modules/rbac_user/main.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/modules/rbac_user/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "ws-main" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "ws-output" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "outputs.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/outputs.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "ws-providers" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "providers.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/providers.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "ws-vars" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("${path.module}/terraform-tfe-workspace-module/variables.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "workflow-tag" {
  repository          = github_repository.terraform-tfe-workspace-module.name
  branch              = "main"
  file                = ".github/workflows/main.yml"
  content             = file("${path.module}/terraform-tfe-workspace-module/.github/workflows/main.yml")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_actions_secret" "example_secret" {
  repository       = github_repository.terraform-tfe-workspace-module.name
  secret_name      = "gh_token"
  plaintext_value  = var.github_token
}

//////// Git repo module
resource "github_repository" "github_create_repo" {
  name        = "terraform-github-repo-module"
  description = "github repo vending"
  visibility = "private"
  auto_init = true

}

resource "github_repository_file" "github_create_repo_workflow" {
  repository          = github_repository.github_create_repo.name
  branch              = "main"
  file                = ".github/workflows/main.yml"
  content             = file("${path.module}/terraform-github-repo-module/.github/workflows/main.yml")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "github_create_repo_main" {
  repository          = github_repository.github_create_repo.name
  branch              = "main"
  file                = "main.tf"
  content             = file("${path.module}/terraform-github-repo-module/main.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}


resource "github_repository_file" "github_create_repo_repo" {
  repository          = github_repository.github_create_repo.name
  branch              = "main"
  file                = "repo.tf"
  content             = file("${path.module}/terraform-github-repo-module/repo.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "github_create_repo_variables" {
  repository          = github_repository.github_create_repo.name
  branch              = "main"
  file                = "variables.tf"
  content             = file("${path.module}/terraform-github-repo-module/variables.tf")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_actions_secret" "github_create_repo_secret" {
  repository       = github_repository.github_create_repo.name
  secret_name      = "gh_token"
  plaintext_value  = var.github_token
}


