
resource "azurerm_virtual_network" "dept_vnet" {
  name = var.dept_vnet_name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space = var.dept_vnet
}

resource "azurerm_subnet" "department_subnets" {
   
   for_each = local.department_subnet

   name = "${each.key}-subnet"
   resource_group_name = azurerm_resource_group.rg.name
   virtual_network_name = var.dept_vnet_name
   address_prefixes = [each.value]

}