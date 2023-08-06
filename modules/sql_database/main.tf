resource "azurerm_sql_server" "pepsi_coke_sql_server" {
  name                         = "myexamplesqlserver"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "mrmayanger"
  administrator_login_password = "Pepsicoke223#"

  tags = {
    environment = "production"
  }
}

resource "azurerm_sql_database" "pepsi_coke_sql_database" {
  name                = "pepsi_coke_sqldatabase"
  resource_group_name = var.rg_name
  location            = var.location
  server_name         = azurerm_sql_server.pepsi_coke_sql_server.name

  tags = {
    environment = "production"
  }
}