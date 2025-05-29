//Security rules for design department
// be able to save to file server
//

resource "azurerm_network_security_group" "design_nsg" {
    name = "Sec rule 1"
    location = var.location
    resource_group_name = var.resource_group_name

    security_rule {
        name = "VM_to_FileServer"
        priority = 101
        access = "Allow"
        protocol                   = "Tcp"   
        direction = "Outbound"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "*"
        destination_address_prefix = "*"

    }

     security_rule {
        name = "FileServer_to_VM"
        priority = 102
        access = "Allow"
        protocol                   = "Tcp"   
        direction = "Inbound"
        source_port_range          = "445"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"

    }

    security_rule {
        name = "allow_https"
        priority = 100
        access = "Allow"
        protocol                   = "Tcp"   
        direction = "Outbound"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"

    }
  
}

resource "azurerm_network_interface_security_group_association" "Design_VM_rule_assio" {
    count = length(var.name_vms)
  network_interface_id = azurerm_network_interface.design_vm_nic[count.index].id
  network_security_group_id = azurerm_network_security_group.design_nsg
}