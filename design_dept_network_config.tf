
//enable nic and public ip to iterate thru VM array list
variable "private_ip_address" {
  type = list(string)
  default = [ "10.30.3.25","10.30.3.27" ]

}

resource "azurerm_network_interface" "design_vm_nic" {

    count = length(var.private_ip_address)
    resource_group_name = var.resource_group_name
    location = var.location
    name = "nic-${count.index}"
    ip_configuration {
      name = "Server_nic_config"
      subnet_id = azurerm_subnet.sub.id
      private_ip_address_allocation = "Static"
      private_ip_address = var.private_ip_address[count.index]
      public_ip_address_id = azurerm_public_ip.design_public_ip[count.index].id
      
    }
}

resource "azurerm_public_ip" "design_public_ip" {
  count = length(var.private_ip_address)
  name = "Desgin_ip-${count.index}"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
} 