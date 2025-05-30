// Security rules for the Server

resource "azurerm_network_security_group" "servernsg" {
    name = "server-nsg"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name



    security_rule {
    name                       = "securityrule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  

  
    security_rule {
    name                       = "securityrule2"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
    
  
}

resource "azurerm_network_interface_security_group_association" "MainServer_Sec_Assio" {
  network_security_group_id = azurerm_network_security_group.servernsg.id
  network_interface_id = azurerm_network_interface.dc_nic.id

}

