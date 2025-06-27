## Project Conclusion

This project demonstrates the end-to-end design and automated deployment of a small organization's hybrid IT infrastructure using Azure and Terraform. The environment replicates a typical on-premises setup, including Active Directory, file servers, group policies, and departmental segmentation, and extends it to the cloud for scalability and resilience.

Key achievements include:
- Automated provisioning of core Azure resources: resource groups, virtual networks, subnets, and Windows servers.
- Secure and efficient Active Directory setup, including domain controller deployment and bulk user/group management via PowerShell.
- Segmentation of departments (IT, HR, Design) into separate subnets, with controlled communication enabled through VNet peering.
- Implementation of a file server with network drives, NTFS permissions, and group-based access control.
- Integration of backup and recovery solutions (e.g., Veeam, Azure File Recovery).
- Use of Infrastructure as Code (Terraform) for repeatable, scalable, and auditable deployments.
- Documentation of troubleshooting steps, best practices, and automation scripts for domain join and server configuration.

The following architecture diagrams summarize the on-premises and Azure infrastructure, showing connectivity, resource layout, and security boundaries:

![Azure Architecture Diagram](diagram.png)

![Azure diagram](Azurediagram1.png)

<!-- Add all PNG and JPG images in the docs folder -->

![Image 3](AD-Users.png)
![Image 4](AD-Groups.png)
![Image 5](AD-OU.png)
![Image 6](AD-GroupPolicy.png)
![Image 7](Fileserver.png)
![Image 8](NetworkDrive.png)
![Image 9](NTFS-permissions.png)
![Image 10](veeam-backup.png)
![Image 11](azure-file-recovery.png) 
![Image 12](azure-portal.png)
![Image 13](azure-vnet.png)
![Image 14](azure-subnets.png)
![Image 15](azure-peering.png)
![Image 16](azure-nsg.png)
![Image 17](azure-vm.png)
![Image 18](azure-publicip.png)
![Image 19](azure-nic.png)
![Image 20](azure-resourcegroup.png)
![Image 21](azure-overview.jpg)
![Image 22](azure-dashboard.jpg)

This foundation supports further automation and configuration management (e.g., with Ansible), enabling robust, secure, and easily managed IT environments for future growth and operational efficiency.


