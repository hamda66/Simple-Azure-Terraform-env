
resource "azurerm_subnet" "sub" {
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    name = "Subnet-${var.Server_subnet_name}"
    address_prefixes = var.Server_subnet
    
  
}