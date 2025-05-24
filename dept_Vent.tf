
resource "azurerm_virtual_network" "dept_vnet" {
  name = var.dept_vnet_name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = var.dept_vnet
}