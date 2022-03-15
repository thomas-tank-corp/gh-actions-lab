// locals {
//   organization_name = var.tfc_org_name
//   workspace_names = [
//     "workshop-tfc-vending-workspace",
//     "workshop-vault-config"
//   ]

//   team_names = [
//     "workshop_team"
//   ]

//   team_assignments = flatten([
//     for ws in local.workspace_names : [
//       for t in local.team_names : {
//         # key MUST be unique for each instance of the combined resource!
//         key = format("%s-%s", ws, t, u)

//         # Will be used as to lookup the resource from data/resource address
//         workspace_key = ws
//         team_key      = t
//         user_id       = u
//       }
//     ]
//   ])
// }

// // resource "tfe_workspace" "ws" {
// //   for_each = toset(local.workspace_names)

// //   organization = local.organization_name
// //   name         = each.key
// // }

// data "tfe_organization_membership" "teams" {
//   for_each = toset(local.user_id)

//   organization = local.tfe_organization_name
//   name         = each.key
// }

// data "tfe_team" "teams" {
//   for_each = toset(local.team_names)

//   organization = local.organization_name
//   name         = each.key
// }


// resource "tfe_team_access" "teams" {
//   for_each     = { for r in local.team_assignments : r.key => r }
//   access       = "read"
//   team_id      = data.tfe_team.teams[each.value.team_key].id
//   workspace_id = tfe_workspace.ws[each.value.workspace_key].id
// }


// # Remove
// output "debug" {
//   value = {
//     workspace_names      = local.workspace_names
//     team_names           = local.team_names
//     team_assignments     = local.team_assignments
//     team_access_for_each = { for r in local.team_assignments : r.key => r }
//   }
// }