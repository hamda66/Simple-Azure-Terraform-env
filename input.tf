
variable "resource_group_name" {
  description = "resouce group name"
  type = string
}

variable "location" {
description = "Location info"
type = string
}


//Main server and file server
variable "vnet_name" {
  type = string
}

variable "Vnet_add" {
  type = set(string)  
}



variable "Server_subnet"{
    type = set(string)
}

variable "Server_subnet_name" {
  type = string
  description = "The name of the server's subnet"
}

variable "Server_name" {
  type = string
  description = "The name of the server"
}

variable "Server_vm_size" {
  type = string
  description = "the size of the VM"
}

variable "Server_publisher" {
  type = string
  description = "The organization that created the image. Examples: Canonical, MicrosoftWindowsServer"
}

variable "Server_offer" {
  type = string
  description = "The name of a group of related images created by a publisher. Examples: UbuntuServer, WindowsServer"
}

variable "Server_sku" {
  type = string
  description = "An instance of an offer, such as a major release of a distribution. Examples: 18.04-LTS, 2019-Datacenter"
}

variable "Server_version" {
  type = string
  description = "The version number of an image SKU."
}

//deptartmnt resources 

variable "dept_subnet"{
    type = set(string)
    description = "Subnet for department"
}

variable "dept_subnet_name" {
  type = string
  description = "The name of the server's subnet"
}

variable "dept_vnet" {
 type = set(string)  
  description = "Virtual network for all departments"
}

variable "dept_vnet_name" {
  type = string
  description = "Department vnet name"
}


/*

variable "VM_vm_size" {
  type = string
  description = "the size of the VM"
}

variable "vm_publisher" {
  type = string
  description = "The organization that created the image. Examples: Canonical, MicrosoftWindowsServer"
}

variable "vm_offer" {
  type = string
  description = "The name of a group of related images created by a publisher. Examples: UbuntuServer, WindowsServer"
}

variable "vm_sku" {
  type = string
  description = "An instance of an offer, such as a major release of a distribution. Examples: 18.04-LTS, 2019-Datacenter"
}

variable "vm_version" {
  type = string
  description = "The version number of an image SKU."
}
*/

