# Packer Configuration for Proxmox

This directory contains Packer configurations for building VM templates on a Proxmox Virtual Environment (PVE). These templates are used for provisioning virtual machines with pre-configured operating systems and settings.

---

## 📂 Directory Structure

```plaintext
.packer/
├── proxmox/
│   ├── Ubuntu24/
│   │   ├── 

ubuntu24.pkr.hcl

          # Packer template for Ubuntu 24
│   │   ├── 

variables.pkr.hcl

         # Variable definitions for Ubuntu 24
│   │   ├── 

override.pkrvars.hcl

      # Override variables for customization
│   │   ├── http/                     # HTTP directory for cloud-init configurations
│   │   │   ├── user-data             # Cloud-init user data for Ubuntu 24
│   ├── Rocky9/
│   │   ├── 

rocky9.frmbuntu

           # Packer template for Rocky Linux 9
│   │   ├── 

variables.pkr.hcl

         # Variable definitions for Rocky Linux 9
│   │   ├── 

override.pkrvars.hcl

      # Override variables for customization
├── commands                          # Scripted commands for validating and building templates
```

---

## 🚀 Features

- **Automated Template Creation**: Build cloud-init–enabled VM templates for Proxmox.
- **Customizable Variables**: Define VM settings such as CPU, memory, disk size, and network configurations.
- **Cloud-Init Integration**: Pre-configure VMs with SSH keys, static IPs, and other settings.
- **Support for Multiple OS**: Includes templates for Ubuntu 24 and Rocky Linux 9.

---

## 🛠️ Usage

### 1. Validate Configuration
Before building a template, validate the configuration:
```bash
packer validate -var-file='variables.pkr.hcl' 

ubuntu24.pkr.hcl


```

### 2. Build Template
Build the VM template:
```bash
packer build -var-file='variables.pkr.hcl' 

ubuntu24.pkr.hcl


```

### 3. Customize Variables
Override default variables by editing `override.pkrvars.hcl`:
```hcl
vm_id = 101
disk_size = "100G"
memory = 4096
```

---

## 📄 Key Files

- **`ubuntu24.pkr.hcl`**: Packer template for Ubuntu 24.
- **`rocky9.frmbuntu`**: Packer template for Rocky Linux 9.
- **`variables.pkr.hcl`**: Default variable definitions.
- **`override.pkrvars.hcl`**: Customizable variable overrides.
- **`http/user-data`**: Cloud-init configuration for automated VM setup.

---

## 🔗 References

- [Packer Documentation](https://www.packer.io/docs)
- [Proxmox Documentation](https://pve.proxmox.com/pve-docs/)


## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Author

- **GitHub**: [zelinar](https://github.com/zelinar)
```

