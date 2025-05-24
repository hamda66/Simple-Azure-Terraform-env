//This is configuration for Orginazation's File server
/*
Note: Windows computer name cannot be more than 15 characters long, be entirely numeric, or contain the following characters: ` ~ ! @ # $ % ^ & * ( ) = + _ [ ] { } \\ | ; : . ' \" , < > 
/ ?." Target="osProfile.computerName"


*/


resource "azurerm_virtual_machine" "file_server"{

 name = "FileServer"
 resource_group_name = var.resource_group_name
 location = var.location
 vm_size = var.Server_vm_size
network_interface_ids = [azurerm_network_interface.file_nic.id]

 os_profile {
   computer_name = "SSOfileserver"
   admin_username = "Hamda"
   admin_password = "Password123!"
   #custom_data = ["joindomain.ps1.b64", "iscsi.ps1.b64"]
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
    provision_vm_agent = true
    }

    ##This will be created after to main server is created, then add it to it's domain
 depends_on = [ azurerm_virtual_machine.mainserver ]
  
  
}

resource "azurerm_network_interface" "file_nic"{
        resource_group_name = var.resource_group_name
        location = var.location
        name = "FileServer_nic"
        ip_configuration {
          name = "FileServer_nic_config"
          subnet_id = azurerm_subnet.sub.id
          private_ip_address_allocation = "Static"
          private_ip_address = "10.10.0.4"
          public_ip_address_id = azurerm_public_ip.file_server_pub.id
    }
}
resource "azurerm_public_ip" "file_server_pub" {
  name                = "FileServerPublicIP"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                = "Standard"

  depends_on = [azurerm_resource_group.rg ]
}

resource "azurerm_virtual_machine_extension" "joindomain" {
    name                 = "joindomain"
    virtual_machine_id   = azurerm_virtual_machine.file_server.id
    publisher           = "Microsoft.Compute"
    type                = "CustomScriptExtension"
    type_handler_version = "1.10"
    
    settings = <<SETTINGS
        {
            
            "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File JoinDomain.ps1 -DomainName 'TestDomain.local' -UserName 'hamda' -Password 'Password123!'"
        }
        SETTINGS

        depends_on = [azurerm_virtual_machine.file_server]


}

resource "azurerm_virtual_machine_extension" "iscsi" {
    name = "iscsi"
    virtual_machine_id = azurerm_virtual_machine.file_server.id
    publisher = "Microsoft.Compute"
    type = "CustomScriptExtension"
    type_handler_version = "1.0"

    settings = <<SETTINGS
    {
        "fileUris": ["iscsi.ps1.b64"],
        "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File iscsi.ps1 -UserName 'hamda' -Password 'Password123!'"
    }
    SETTINGS

    depends_on = [azurerm_virtual_machine_extension.joindomain]

}
