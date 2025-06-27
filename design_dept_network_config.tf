

//enable nic and public ip to iterate thru VM array list
variable "private_ip_address" {
  type = list(string)
  default = [ "10.10.3.25","10.10.3.27" ]

}

resource "azurerm_network_interface" "design_vm_nic" {

    count = length(var.private_ip_address)
    resource_group_name = var.resource_group_name
    location = var.location
    name = "nic-${count.index}"
    ip_configuration {
      name = "Design_nic_config"
// change subnet, should be department_subnets. Design is 2nd position in dept list, 
      subnet_id = azurerm_subnet.department_subnets["Design"].id
      private_ip_address_allocation = "Static"
      private_ip_address = var.private_ip_address[count.index]
      public_ip_address_id = azurerm_public_ip.design_public_ip[count.index].id
      
    }
}

resource "azurerm_public_ip" "design_public_ip" {
  count = length(var.private_ip_address)
  name = "Desgin_ip-${count.index}"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
} 