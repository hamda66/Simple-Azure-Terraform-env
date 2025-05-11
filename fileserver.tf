
resource "azurerm_virtual_machine" "file_server"{

 name = "FileServer"
 resource_group_name = var.resource_group_name
 location = var.location
 vm_size = var.Server_vm_size
network_interface_ids = [azurerm_network_interface.file_nic.id]

 os_profile {
   computer_name = "SSO_fileserver"
   admin_username = "Hamda"
   admin_password = "Password123!"
 }

 storage_os_disk {   
    name = "FileServerDisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
 }

 storage_image_reference {
   publisher = var.Server_publisher
   offer     = var.Server_offer
   sku       = var.Server_sku
   version   = var.Server_version
 }

    os_profile_windows_config {
    enable_automatic_upgrades = false
    }

    

  
  
}

resource "azurerm_network_interface" "file_nic"{
        resource_group_name = var.resource_group_name
        location = var.location
        name = "FileServer_nic"
        ip_configuration {
          name = "FileServer_nic_config"
          subnet_id = azurerm_subnet.sub.id
          private_ip_address_allocation = "Static"
          private_ip_address = "10.0.0.4"
          public_ip_address_id = azurerm_public_ip.file_server_pub.id
    }
}
resource "azurerm_public_ip" "file_server_pub" {
  name                = "FileServerPublicIP"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                = "Standard"
}