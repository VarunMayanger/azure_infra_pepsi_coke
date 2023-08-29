
resource "azurerm_container_registry" "acr" {
  name                     = var.acr_container_name
  resource_group_name      = var.acr_resourse_group_name
  location                 = var.acr_resourse_group_location
  sku                      = var.acr_sku
}
