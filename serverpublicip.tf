
//public IP for AD server

resource "azurerm_public_ip" "serverippub" {
 name = "serverpublicip"
 location = var.location
 resource_group_name = azurerm_resource_group.rg.name
 allocation_method = "Static"
 

}