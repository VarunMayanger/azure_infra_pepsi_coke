resource "azurerm_storage_account" "sa" {
  name                     = "${var.sa_base_name}sa"
  resource_group_name      = "${var.sa_resource_group_name}"
  location                 = var.sa_location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
}