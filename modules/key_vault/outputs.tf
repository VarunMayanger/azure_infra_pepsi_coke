output "keyvault_id" {
    value = azurerm_key_vault.kv.id
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.kv_secrets.value
  sensitive = true
}