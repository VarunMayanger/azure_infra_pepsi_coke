locals {
 env_variables = {
   DOCKER_REGISTRY_SERVER_URL            = "https://arc01.azurecr.io"
   DOCKER_REGISTRY_SERVER_USERNAME       = var.acr_ussername
   DOCKER_REGISTRY_SERVER_PASSWORD       = var.acr_pswd
 }
}

resource "azurerm_app_service" "my_app_service_container" {
 name                    = var.web_app_service_name
 location                = var.web_app_service_location
 resource_group_name     = var.web_app_service_resource_group
 app_service_plan_id     = var.web_aap_service_plan_id
 https_only              = true
 client_affinity_enabled = true
 site_config {
   scm_type          = "VSTSRM"
   always_on         = "true"
   linux_fx_version  = "DOCKER|arc01.azurecr.io/myapp:latest" #define the images to user for the application
   health_check_path = "/" # health check required in order that internal app service plan loadbalancer do not loadbalance on instance down
 }
 
 identity {
   type         = "SystemAssigned, UserAssigned"
   identity_ids = [azurerm_user_assigned_identity.example.id]
 }

 app_settings = local.env_variables 
}

resource "azurerm_user_assigned_identity" "example" {
  resource_group_name = "pepsirg"
  location            = "East US"
  name                = "search-api"
}


