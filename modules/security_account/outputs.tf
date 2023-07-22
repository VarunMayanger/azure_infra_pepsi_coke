output "security_account_name" {
  value = azurerm_storage_account.sa.name
}

output "security_account_location"{
    value = azurerm_storage_account.sa.location
}

output "security_account_tier" {
  value = azurerm_storage_account.sa.account_tier
}

output "security_account_replication_type" {
  value = azurerm_storage_account.sa.account_replication_type
}

output "security_account_resourse_group_name" {
    value = azurerm_storage_account.sa.resource_group_name
  
}