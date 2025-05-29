

//Notes: Windows servers cannot have special characters or more than 15 characters

/*
  This tf config creates a Windows server with the following features:
  - A public IP address
  - A network interface
  - A virtual network
  - A subnet
  - A resource group
  - A virtual machine
  - An extension to install Active Directory Domain Services (AD DS)
*/


resource "azurerm_virtual_machine" "mainserver" {
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    name = var.Server_name

    network_interface_ids = [azurerm_network_interface.dc_nic.id]


    vm_size = var.Server_vm_size

    
    
 
    storage_image_reference {
    publisher = var.Server_publisher
    offer     = var.Server_offer
    sku       = var.Server_sku
    version   = var.Server_version
    }

    os_profile {
    computer_name  = "mainserver"
    admin_username = "Hamda"
    admin_password = "Password123!"
    custom_data = ("script.ps1")
    }

    storage_os_disk {
    name              = "ServerDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }

    os_profile_windows_config {
   enable_automatic_upgrades = false
   provision_vm_agent = true
    }

  
    
}

//Note: Resource name cannot be all capitals
    // Remove the invalid attribute and use azurerm_network_interface_security_group_association to associate the NSG
resource "azurerm_network_interface" "dc_nic" {
    resource_group_name = var.resource_group_name
    location = var.location
    name = "dc_nic"
    ip_configuration {
      name = "Server_nic_config"
      subnet_id = azurerm_subnet.sub.id
      private_ip_address_allocation = "Static"
      private_ip_address = "10.10.0.5"
      public_ip_address_id = azurerm_public_ip.serverippub.id
      
    }
    
  
}

//Server script extension

 
resource "azurerm_virtual_machine_extension" "server_script" {

  name = "InstallAD"
  virtual_machine_id = azurerm_virtual_machine.mainserver.id
  type = "CustomScriptExtension"
  publisher = "Microsoft.compute"
  type_handler_version = "1.10"


   settings = <<SETTINGS
  {
    "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Write-Host 'This script must be run as Administrator.'; exit }; Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools; Import-Module ADDSDeployment; Install-ADDSForest -DomainName 'TestDomain.local' -DomainNetbiosName 'TESTDOMAIN' -SafeModeAdministratorPassword (ConvertTo-SecureString 'P@ssw0rd123!' -AsPlainText -Force) -InstallDNS -Force -NoRebootOnCompletion; Restart-Computer -Force\""
  }
  SETTINGS

  depends_on = [ azurerm_virtual_machine.mainserver]

}
