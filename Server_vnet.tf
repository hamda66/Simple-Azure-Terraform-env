resource "azurerm_virtual_network" "vnet" {
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    address_space = var.Vnet_add
    name = var.vnet_name
  
}