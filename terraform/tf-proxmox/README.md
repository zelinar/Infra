# Terraform Proxmox VM Deployment

This Terraform project automates the creation of multiple cloud-init–enabled virtual machines (VMs) on a Proxmox VE cluster using an existing template. It supports defining VM groups, customizing resources, and assigning static IPs via cloud-init.

## Project Layout
```
tf-proxmox/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── terraform.tfstate
├── terraform.tfstate.backup
├── README.md
└── .terraform/
```

## Features
- **Cloud-init Integration**: Automatically configures VMs with static IPs, SSH keys, and other settings.
- **Proxmox API Integration**: Uses the Proxmox Terraform provider to interact with the Proxmox VE cluster.
- **Scalability**: Supports multiple VM groups with unique configurations.
- **Customizable Resources**: Allows customization of CPU, memory, disk, and network settings.

## Requirements
- **Proxmox VE**: Version 7.x or 8.x.
- **Terraform**: Version >= 1.5.
- **Proxmox API Token**:
  - Required permissions: `VM.Allocate`, `VM.Clone`, `VM.Config.CloudInit`, `VM.PowerMgmt`, `VM.Audit`.
- **Cloud-init Template**:
  - `qemu-guest-agent` installed.
  - `/etc/cloud/cloud.cfg.d/99-pve.cfg` configured:
    ```yaml
    datasource_list: [ NoCloud, ConfigDrive ]
    datasource:
      NoCloud:
        seedfrom: /dev/sr0
    ```

## Variables Overview
All variables are declared in `variables.tf`. Key variables include:
- **Proxmox Configuration**:
  - `pm_api_url`: Proxmox API endpoint (e.g., `https://10.10.20.20:8006/api2/json`).
  - `pm_api_token_id`: API token ID (e.g., `user@realm!token`).
  - `pm_api_token_secret`: API token secret.
- **VM Configuration**:
  - `vm_groups`: Grouped VM definitions, including `target_node`, `template_name`, `disk_size_gb`, `memory_mb`, and `vms` (list of VM names and IPs).
  - `full_clone`: Whether to use full clones (default: `true`).
  - `disk_storage`: Proxmox storage name (e.g., `VM-storage`).
  - `net_bridge`: Network bridge (default: `vmbr0`).
  - `gateway`: Default gateway for static IPs.

## Usage
1. **Initialize the Project**:
   ```bash
   terraform init
   ```
2. **Validate the Configuration**:
   ```bash
   terraform validate
   ```
3. **Preview Changes**:
   ```bash
   terraform plan -var-file="terraform.tfvars"
   ```
4. **Apply Changes**:
   ```bash
   terraform apply -var-file="terraform.tfvars"
   ```
5. **Destroy Resources**:
   ```bash
   terraform destroy -var-file="terraform.tfvars"
   ```

## Example `terraform.tfvars`
```hcl
pm_api_url     = "https://10.10.20.20:8006/api2/json"
pm_api_token_id = "root@pam!root-token"
pm_api_token_secret = "my-secret"

vm_groups = {
  k8s-management-cluster = {
    target_node   = "homelab-server"
    template_name = "ubuntu25-server-template"
    gateway       = "10.10.20.1"
    disk_size_gb  = 500
    memory_mb     = 4096
    onboot        = true
    vms = [
      { name = "k8s-management-control-plane", ip = "10.10.20.110" },
      { name = "k8s-management-worker-node01", ip = "10.10.20.111" },
      { name = "k8s-management-worker-node02", ip = "10.10.20.112" },
      { name = "k8s-management-worker-node03", ip = "10.10.20.113" },
    ]
  }
}  
```

## Security
- **Sensitive Data**: Do not commit `terraform.tfvars` or `.tfstate` files to version control. Add them to `.gitignore`:
  ```
  *.tfstate
  *.tfstate.backup
  terraform.tfvars
  ```
- **Secrets Management**: Use a secret manager (e.g., HashiCorp Vault, AWS Secrets Manager) or Terraform Cloud variables for production environments.

## Troubleshooting
- **Common Issues**:
  - **API Token Errors**: Ensure the token has the required permissions.
  - **SSH Not Available**: Verify the cloud-init template includes `qemu-guest-agent` and accepts injected credentials.
  - **Timeouts**: Check network connectivity and Proxmox API availability.
- **Debugging**:
  - Enable Terraform debug logs:
    ```bash
    TF_LOG=DEBUG terraform apply
    ```

## References
- [Proxmox Documentation](https://pve.proxmox.com/pve-docs/)
- [Terraform Documentation](https://www.terraform.io/docs/)
- [Terraform Proxmox Provider](https://registry.terraform.io/providers/telmate/proxmox/latest)
