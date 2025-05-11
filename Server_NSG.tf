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

  tags = {
    environment = "Production"
  }
    
  
}

