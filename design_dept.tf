
//1.Create seprate subnet for Design Deptartment
//2.Create VM for Design Deptartment

resource "azurerm_subnet" "design_subnet" {
  name = var.dept_subnet_name
 resource_group_name = azurerm_resource_group.rg.name
  address_prefixes = var.dept_subnet
  virtual_network_name = var.dept_vnet_name
}