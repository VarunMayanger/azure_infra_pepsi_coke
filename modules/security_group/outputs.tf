output "security_group_name" {
    value = azurerm_network_security_group.sg.name
}

output "security_group_location" {
    value = azurerm_network_security_group.sg.location
}

output "security_group_resource_group_name" {
    value = azurerm_network_security_group.sg.resource_group_name
}



