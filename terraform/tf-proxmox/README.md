# Terraform Proxmox VM Deployment

This Terraform project automates creation of multiple cloud-init–enabled virtual machines on a Proxmox VE cluster using an existing template.

Each VM is defined in `terraform.tf.vars` (variable `vms`) and Terraform clones the base template, configures CPU/memory/disk/network and assigns an IP.

Project layout
---------------
```
terraform-proxmox-vm/
├── main.tf
├── variables.tf
├── terraform.tf.vars
└── README.md
```

Requirements
------------
- Proxmox VE 7.x / 8.x
- A cloud-init enabled template on Proxmox:
  - `qemu-guest-agent` installed
  - `/etc/cloud/cloud.cfg.d/99-pve.cfg` present with:
    ```
    datasource_list: [ NoCloud, ConfigDrive ]
    datasource:
      NoCloud:
        seedfrom: /dev/sr0
    ```
- Terraform >= 1.5
- A Proxmox API token with sufficient permissions:
  - Example required privileges: `VM.Allocate VM.Clone VM.Config.CloudInit VM.PowerMgmt VM.Audit`

Provider configuration (main.tf)
-------------------------------
```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "= 3.0.2-rc03"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
}
```

Variables overview (variables.tf)
--------------------------------
All variables are declared in `variables.tf`. Key variables:

- `pm_api_url` (string): Proxmox API endpoint, e.g. `https://10.10.20.20:8006/api2/json`
- `pm_api_token_id` (string): API token id, format `user@realm!token`
- `pm_api_token_secret` (string): API token secret
- `target_node` (string): Proxmox node where VMs will be created
- `template_name` (string): name of existing cloud-init template to clone
- `vms` (list(object)): list of VM definitions, each object contains `name` and `ip`
- `full_clone` (bool, default true): use full clone or linked clone
- `agent` (number, default 1): enable QEMU guest agent
- `cores` (number, default 2), `sockets` (number, default 1), `cpu_type` (string, default "host")
- `memory_mb` (number, default 2048)
- `disk_size_gb` (number, default 25)
- `disk_storage` (string): Proxmox storage name (e.g., "local-lvm")
- `net_bridge` (string, default "vmbr0")
- `net_model` (string, default "virtio")
- `net_cidr` (string, default "24")
- `gateway` (string): default gateway for static IPs

Example terraform.tf.vars
-------------------------
Replace with your values, keep this file out of version control.

```hcl
pm_api_url          = "https://10.10.20.20:8006/api2/json"
pm_api_token_id     = "root@pam!root-token"
pm_api_token_secret = "my-secret"

target_node   = "homelab-server"
template_name = "ubuntu25-server-template"

vms = [
  { name = "k8s-control-plane", ip = "10.10.20.110" },
  { name = "k8s-worker-node01", ip = "10.10.20.112" },
  { name = "k8s-worker-node02", ip = "10.10.20.113" },
]

gateway      = "10.10.20.1"
disk_size_gb = 500
memory_mb    = 4096
```

How it works
------------
- Terraform reads `var.vms` and creates one `proxmox_vm_qemu` resource per entry.
- Each VM is cloned from the specified template and configured with the provided CPU, memory, disk and network settings.
- Static IPs are applied via `ipconfig0 = "ip=<ip>/<cidr>,gw=<gateway>"` for cloud-init.

Usage
-----
Initialize:
```
terraform init
```

Validate:
```
terraform validate
```

Preview:
```
terraform plan -var-file="terraform.tf.vars"
```

Apply:
```
terraform apply -var-file="terraform.tf.vars" -auto-approve
```

Destroy:
```
terraform destroy -var-file="terraform.tf.vars" -auto-approve
```

Common pitfalls and troubleshooting
----------------------------------
- Provider panic `interface conversion: interface {} is string, not float64`:
  - Ensure numeric variables are not quoted. Example: `memory_mb = 2048` (not `"2048"`).
- `Request cancelled`:
  - Usually an API timeout or provider error. Check network access and token validity.
- SSH not available after clone:
  - Make sure your template has cloud-init and `qemu-guest-agent` installed and that it accepts cloud-init injected credentials or SSH keys.
- `Waiting for cloud-init` or install falls to interactive menu:
  - Verify the Packer-built template or the installer passes `autoinstall ds=nocloud-net;s=http://<host>:<port>/`
  - Ensure the HTTP seed files `user-data` and `meta-data` are reachable from the installer VM.
- Installing packages in autoinstall (`packages:` or `late-commands`) failing:
  - Run `apt-get update` before installs and use `DEBIAN_FRONTEND=noninteractive`.
  - Use `curtin in-target -- bash -c '...'` for commands that must run inside the target root.
  - Add retry loops and logging to `/var/log/cloud-init-debug.log`.

Extending the configuration
---------------------------
- Add `sshkeys` to the VM block so the created VM has your public key injected:
```hcl
sshkeys = <<EOF
ssh-ed25519 AAAAC3... user@host
EOF
```
- Add `ciuser` and `cipassword` to configure cloud-init user on clone.
- Configure `agent = 1` to enable QEMU guest agent support.

Security
--------
- Do not commit `terraform.tf.vars` or any file containing secrets to git.
- Put `terraform.tf.vars` and `.tfstate` files in `.gitignore`:
```
*.tfstate
*.tfstate.backup
terraform.tf.vars
```
- Consider using a secret manager (Vault, AWS Secrets Manager) or Terraform Cloud variables for production.