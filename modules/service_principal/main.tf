data "azuread_application_published_app_ids" "well_known" {}

resource "azuread_service_principal" "msgraph" {
  application_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing   = true
}

resource "azuread_application" "example" {
  display_name = "example"

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = azuread_service_principal.msgraph.app_role_ids["Directory.ReadWrite.All"]
      type = "Role"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["Directory.ReadWrite.All"]
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "main" {
  application_id = azuread_application.example.application_id
}