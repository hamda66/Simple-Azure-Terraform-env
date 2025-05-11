/*  

resource "azurerm_windows_virtual_machine" "mainserver" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  name                  = var.Server_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.Server_vm_size

  storage_image_reference {
    publisher = var.Server_publisher
    offer     = var.Server_offer
    sku       = var.Server_sku
    version   = var.Server_version
  }

  os_profile {
    computer_name              = "mainserver"
    admin_username             = "Hamda"
    admin_password             = "Password123!"
    allow_extension_operations = true
  }

  storage_os_disk {
    name              = "ServerDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
  }
}
*/
