resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.web_app_service_resource_name
  location            = var.web_app_service_location
  resource_group_name = var.web_app_service_resource_group_name
  kind                = var.web_app_service_kind
  reserved            = var.web_app_service_reserved

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

