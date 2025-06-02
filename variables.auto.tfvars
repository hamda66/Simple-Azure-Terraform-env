
resource_group_name = "rg-test"
location = "West US"


//server network
Vnet_add = ["10.10.0.0/16"]
vnet_name = "Test-VNET"

// department variable
dept_vnet_name = "Departments"
dept_vnet = ["10.30.0.0/16"]


//DC server inputs
Server_subnet = [ "10.10.0.0/24" ]
Server_subnet_name = "active_Server_subnet"
Server_name = "DC"
Server_vm_size = "Standard_A2_v2"

Server_publisher = "MicrosoftWindowsServer"
Server_offer     = "WindowsServer"
Server_sku       = "2016-Datacenter"
Server_version   = "latest"



//department VMs
VM_vm_size = "Standard_B1ls"
vm_offer = "windows-11"
vm_sku = "win11-21h2-avd"
vm_publisher = "MicrosoftWindowsDesktop"
vm_version = "latest"

