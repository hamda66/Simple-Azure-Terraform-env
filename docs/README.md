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

![Azure Architecture Diagram](docs/diagram.png)

![Azure diagram](docs/Azurediagram1.png)

<!-- Add all PNG and JPG images in the docs folder -->
![Image 1](docs/diagram.png)
![Image 2](docs/Azurediagram1.png)
![Image 3](docs/AD-Users.png)
![Image 4](docs/AD-Groups.png)
![Image 5](docs/AD-OU.png)
![Image 6](docs/AD-GroupPolicy.png)
![Image 7](docs/Fileserver.png)
![Image 8](docs/NetworkDrive.png)
![Image 9](docs/NTFS-permissions.png)
![Image 10](docs/veeam-backup.png)
![Image 11](docs/azure-file-recovery.png) 
![Image 12](docs/azure-portal.png)
![Image 13](docs/azure-vnet.png)
![Image 14](docs/azure-subnets.png)
![Image 15](docs/azure-peering.png)
![Image 16](docs/azure-nsg.png)
![Image 17](docs/azure-vm.png)
![Image 18](docs/azure-publicip.png)
![Image 19](docs/azure-nic.png)
![Image 20](docs/azure-resourcegroup.png)
![Image 21](docs/azure-overview.jpg)
![Image 22](docs/azure-dashboard.jpg)

This foundation supports further automation and configuration management (e.g., with Ansible), enabling robust, secure, and easily managed IT environments for future growth and operational efficiency.


