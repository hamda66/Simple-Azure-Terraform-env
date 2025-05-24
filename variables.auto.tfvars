
resource_group_name = "rg-test"
location = "West US"


Vnet_add = ["10.10.0.0/16"]
vnet_name = "Test-VNET"
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

//Design department variable
dept_subnet = [ "10.30.1.0/24" ]
dept_subnet_name = "Design_subnet"

