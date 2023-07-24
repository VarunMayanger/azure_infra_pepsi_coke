data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                       = var.keyvault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = false
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  enable_rbac_authorization = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions
    storage_permissions = var.secret_permissions
    }
}

resource "azurerm_key_vault_secret" "kv_secrets" {
  name         = var.name
  value        = var.value
  key_vault_id = azurerm_key_vault.kv.id
}

