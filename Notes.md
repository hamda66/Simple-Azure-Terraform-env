
<u> My NOTES </u>

<b>Objective:</b>
My objective of this project to create a dublicate enviroment of a small orginization on Azure using Terraform. (Later on might use Ansible) 

1. create Resource group, VNET, Subnet, Windows datacenter server ✔️ 
2. Set up AD ✔️
3. Bulk import Users to AD using powershell script
4. Set up file server and create network drive
5. create 3 departments with seperate subnet. Departments must be able to communicate via peering.




### Note ##
- To delete backup and clean up local files:
rm *.terraform.lock.hcl
rm *.tfstate.*
rm *.tfstate

- VM must have a public IP to access/RDP into it. (12/04/24)

- DO NOT DELETE tfstate file UNTILL YOU HAVE DESTROYED RESOURCES USING TERRAFORM DESTROY

- Use version 3.6.0 Terraform, Latest version asks for a subscription ID. Might be a bug!

- For VMs, You can replace the version number in the URN with latest to use the latest version of the image.

- Resource name cannot be all capitals

  ---To resolve the following error:
    Decryption failed: [WinError 87]  App developer may consider this guidance: https://github.com/AzureAD/microsoft-authentication-extensions-for-python/wiki/PersistenceDecryptionError

    ~~ run this command in powershell / terminal:
                Remove-Item -Recurse -Force "$env:USERPROFILE\.azure"

- Required resources to create stardard VM:
    - vm_size
    - network_interface_ids = [azurerm_network_interface.nic.id]
    - storage_image_reference : publisher, offer, sku, version
    - os_profile : computer_name, admin_username, admin_password
    - storage_os_disk : name, caching, create_option, managed_disk_type
    - os_profile_windows_config : enable_automatic_upgrades, provision_vm_agent
    - resource "azurerm_network_interface" 
    - resource "azurerm_public_ip"  --link th public IP to the nic configuration

- allocation_method for IP can either be Staic or Dynamic 