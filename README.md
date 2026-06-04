# Infra repository Overview
![GitHub repo size](https://img.shields.io/github/repo-size/zelinar/Infra)
![GitHub contributors](https://img.shields.io/github/contributors/zelinar/Infra)
![GitHub stars](https://img.shields.io/github/stars/zelinar/Infra?style=social)
![GitHub forks](https://img.shields.io/github/forks/zelinar/Infra?style=social)
![GitHub last commit](https://img.shields.io/github/last-commit/zelinar/Infra)
![GitHub issues](https://img.shields.io/github/issues/zelinar/Infra)
![GitHub pull requests](https://img.shields.io/github/issues-pr/zelinar/Infra)
![GitHub license](https://img.shields.io/github/license/zelinar/Infra)

This repository contains multiple subprojects for managing infrastructure and automation. It's goal is only edjucational - learning terraform VM provisioning, creating k8s clusters via ansible, and k8s cluster bootstraping via ArgoCD. Below is an overview of the subprojects and their purposes.

## Subprojects

### 1. **Ansible**
- **Description**: Contains playbooks and roles for automating infrastructure tasks such as Kubernetes cluster setup, Proxmox configuration, and more.
- **Key Files**:
  - `ansible.cfg`: Configuration file for Ansible.
  - `create_k8s_cluster.yaml`: Playbook for setting up a Kubernetes cluster.
  - `roles/`: Directory containing reusable Ansible roles.
- **Notable Roles**:
  - `install_containerd`: Installs and configures the container runtime.
  - `deploy_cluster_addons`: Deploys Kubernetes addons like ArgoCD.
  - `configure_hosts_file`: Configures the `/etc/hosts` file on nodes.

### 2. **Packer**
- **Description**: Contains configurations for building VM templates using Packer.
- **Key Files**:
  - `vars_credentials.pkr.hcl`: Contains sensitive variables (ignored in `.gitignore`).
  - `proxmox/`: Directory with Packer configurations for Proxmox templates.
  - `commands`: Scripted commands for validating and building templates.

### 3. **Terraform**
- **Description**: Automates the provisioning of infrastructure resources on Proxmox.
- **Key Files**:
  - `api-token-terraform-pve`: Contains API tokens for Terraform (ignored in `.gitignore`).
  - `tf-proxmox/`: Terraform configurations for Proxmox.
  - `terraform.tfstate`: Tracks the state of the infrastructure (ignored in `.gitignore`).

### 4. **General**
- **Description**: Contains general configuration files and documentation.
- **Key Files**:
  - `.gitignore`: Specifies files and directories to be ignored by Git.
  - `LICENSE`: License file for the repository.
  - `README.md`: Documentation for the repository.

---

## Getting Started

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Explore Subprojects**:
   - Navigate to the respective directories (`ansible/`, `packer/`, `terraform/`) to explore their contents.

3. **Run Automation**:
   - Follow the instructions in each subproject's README or documentation to execute tasks.

---

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Author

- **GitHub**: [zelinar](https://github.com/zelinar)
```


