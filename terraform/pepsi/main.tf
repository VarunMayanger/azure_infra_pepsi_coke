# local variables

# terraform provider 

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.42.0"
    }
  }
   cloud {
    organization = "mrmayanger"
    workspaces {
    name = "pepsi_coke"
    }
   }
  
}



# Configure the Microsoft Azure Provider

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

# resourse module

module "resourse_group" {
  source    = "../../modules/resourse_group"
  base_name = "pepsi"
  location  = "East US"

}

# security account

module "security_account" {
  source                      = "../../modules/security_account"
  sa_base_name                = "pepsisa"
  sa_location                 = "East US"
  sa_resource_group_name      = module.resourse_group.resourse_group_name
  sa_account_tier             = "Standard"
  sa_account_replication_type = "GRS"
  depends_on                  = [module.resourse_group]
}

# security group

module "security_group" {
  source                                   = "../../modules/security_group"
  security_rule_destination_address_prefix = "*"
  security_rule_source_address_prefix      = "*"
  security_rule_destination_port_range     = "*"
  security_rule_source_port_range          = "*"
  security_rule_protocol                   = "Tcp"
  security_rule_access                     = "Allow"
  security_rule_direction                  = "Inbound"
  security_rule_priority                   = 100
  security_rule_name                       = "pepsiSR"
  sg_resource_group_name                   = module.resourse_group.resourse_group_name
  sg_location                              = "East US"
  depends_on                               = [module.resourse_group]
}

# service principals

module "service_principal" {
  source                 = "../../modules/service_principal"
  service_principal_name = "client_service_principal"
  depends_on             = [module.resourse_group]
}



# role assignment

resource "azurerm_role_assignment" "main" {
  scope                = "/subscriptions/95657feb-1223-4d45-938f-fe10eadfa20e"
  role_definition_name = "Contributor"
  principal_id         = module.service_principal.service_principal_object_id
  depends_on           = [module.service_principal]
}

module "key_vault" {
  source                      = "../../modules/key_vault"
  keyvault_name               = "kev23q3"
  location                    = "East US"
  resource_group_name         = module.resourse_group.resourse_group_name
  service_principal_name      = module.service_principal.service_principal_name
  service_principal_object_id = module.service_principal.service_principal_object_id
  service_principal_tenant_id = module.service_principal.service_principal_tenant_id
  depends_on                  = [module.service_principal]
}

module "key_vault_policy" {
  source       = "../../modules/key_vault_policy"
  key_vault_id = module.key_vault.keyvault_id
}

module "kv_secrets" {
  source       = "../../modules/kv_secrets"
  name         = module.service_principal.client_id
  value        = module.service_principal.client_secret
  key_vault_id = module.key_vault.keyvault_id
  depends_on   = [module.key_vault, module.key_vault_policy]
}

module "container_registry" {
  source                       = "../../modules/container_registry"
  acr_container_name           = "crmrmayanger"
  acr_resourse_group_name      = module.resourse_group.resourse_group_name
  acr_resourse_group_location  = "East US"
  acr_sku                      = "Premium"
  acr_admin_enabled            = false
  acr_georeplication_locations = ["East US", "West Europe"]
}

module "web_app_service_plan" {
  source                              = "../../modules/web_app_service_plan"
  web_app_service_resource_name       = "mrmayanger"
  web_app_service_location            = "East US"
  web_app_service_resource_group_name = module.resourse_group.resourse_group_name
  web_app_service_kind                = "linux"
  web_app_service_reserved            = true
  sku_tier                            = "Standard"
  sku_size                            = "S1"
  depends_on = [ module.container_registry ]
}

module "web_app_service" {
  source                         = "../../modules/web_app_service"
  web_app_service_name           = "mrmayanger"
  web_app_service_location       = "East US"
  acr_ussername                  = module.container_registry.username
  acr_pswd                       = module.container_registry.pwd
  web_app_service_resource_group = module.resourse_group.resourse_group_name
  web_aap_service_plan_id        = module.web_app_service_plan.id
  depends_on                     = [module.web_app_service_plan]
}

