
//1.Create seprate subnet for Design Deptartment
//2.Create VM for Design Deptartment

##not completed yet, still need to configure nsg, nic, storage for both VMS
##Must also place in correct subnet and  count/loop thru 2 vms

variable "name_vms" {
  type = list(string)
  default = [ "Design_VM1", "Design_VM2" ]
}

resource "azurerm_virtual_machine" "designvm" {
  count = length(var.name_vms)
 resource_group_name = var.resource_group_name
  name = "Design_VM-${count.index}"
 location = var.location

 vm_size =  var.VM_vm_size

 network_interface_ids = [ azurerm_network_interface.design_vm_nic[count.index].id ]


 os_profile {
   admin_username = "hamda"
   admin_password = "Password123!"
   computer_name = "ssodesign"
 }

 storage_os_disk {
    name              = "vmDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }

 os_profile_windows_config {
   enable_automatic_upgrades = false
 }

 storage_image_reference {
   publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
 }

}
