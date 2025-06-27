
variable "webname" {
  default = "web_server"
  description = "Variable holds string for name input"
}

resource "azurerm_virtual_machine" "web_server" {
  name = "Web_server"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_size = var.Server_vm_size
  network_interface_ids = [azurerm_network_interface.web_server_nic.id]

os_profile {
computer_name = "Hamda_webserver"
admin_username = "Hamda"
admin_password = "Password123!"  
}

storage_os_disk {
    name = "Webserver"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_id = "Standard_LRS"
  
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


resource "azurerm_network_interface" "web_server_nic" {
  name = "web_server_nic"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name = "webserver_nic_config"
    subnet_id = azurerm_subnet.sub.id
    private_ip_address = "10.10.0.10"
    private_ip_address_allocation = "Static"
    public_ip_address_id = azurerm_public_ip.web_server_pip.id
  }
}

resource "azurerm_public_ip" "web_server_pip" {
  name = "${var.webname}-pip"
  allocation_method = "Static"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku = "Standard"
}

resource "azurerm_virtual_machine_extension" "web_extension" {
  name = "${var.webname}-ex"
  virtual_machine_id = azurerm_virtual_machine.web_server.id
  publisher = "Microsoft.Compute"
  type = "CustomScriptExtension"
  type_handler_version = "1.0"

  settings = <<SETTINGS
  {
    "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command  \"if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Write-Host 'This script must be run as Administrator.'; exit }; Install-WindowsFeature -Name Web-Server -IncludeManagementTools;"
  }
  SETTINGS
 
}