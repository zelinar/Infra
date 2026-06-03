# 🛠️ Ansible Automation for Homelab Management


## 📖 Overview

This repository contains a collection of **Ansible playbooks** and **roles** to automate the management of a homelab environment. It includes tasks for configuring Proxmox VE, Kubernetes clusters, Docker, and other essential tools for a modern infrastructure.

### Key Features:
- **Backup Automation**: Automate local system backups with 

backup_localhost.yaml

.
- **Kubernetes Cluster Setup**: Deploy and configure Kubernetes clusters with 

create_k8s_cluster.yaml

.
- **Proxmox Configuration**: Manage Proxmox VE nodes with 

configure-proxmomx-host.yaml

.
- **Role-Based Modularity**: Reusable roles for installing Docker, configuring hosts, and more.

---

## 📂 Project Structure

```plaintext
.
├── ansible.cfg
├── backup_localhost.yaml
├── cluster_argocd_bootstrap.yaml
├── configure-proxmomx-host.yaml
├── create_k8s_cluster.yaml
├── inventory/
│   ├── hosts
├── group_vars/
│   ├── all.yaml
│   ├── control_plane_prx.yaml
│   ├── workers_prx.yaml
├── host_vars/
│   ├── homelab-server/
├── roles/
│   ├── argocd_prerequisites/
│   ├── check_sw_versions/
│   ├── configure_hosts_file/
│   ├── create_api_user/
│   ├── deploy_cluster_addons/
│   ├── install_containerd/
│   ├── install_docker/
│   ├── install_updates/
│   └── ...
└── test-playbook.yaml
```

---

## 🚀 Getting Started

### Prerequisites
- **Ansible**: Install Ansible on your control node.
  ```bash
  sudo apt update && sudo apt install ansible -y
  ```
- **Proxmox VE**: Ensure Proxmox VE is installed and accessible.
- **Kubernetes**: Install `kubectl` and `kubeadm` for Kubernetes management.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```
2. Configure your inventory file:
   - Edit 

hosts

 to match your environment.

3. Install required roles:
   ```bash
   ansible-galaxy install -r requirements.yml
   ```

---

## 🛠️ Usage

### Backup Local System
Run the 

backup_localhost.yaml

 playbook to back up your local system:
```bash
ansible-playbook backup_localhost.yaml
```

### Configure Proxmox VE
Set up Proxmox VE nodes using the 

configure-proxmomx-host.yaml

 playbook:
```bash
ansible-playbook configure-proxmomx-host.yaml
```

### Create Kubernetes Cluster
Deploy a Kubernetes cluster with 

create_k8s_cluster.yaml

:
```bash
ansible-playbook create_k8s_cluster.yaml
```

---

## 📜 Roles

### Key Roles:
- **`install_docker`**: Installs Docker and its dependencies.
- **`install_containerd`**: Sets up Containerd as a runtime.
- **`create_api_user`**: Creates API users for Terraform and Packer.
- **`deploy_cluster_addons`**: Deploys essential Kubernetes addons like Calico and ArgoCD.

### Adding New Roles:
1. Create a new role:
   ```bash
   ansible-galaxy init roles/your-role-name
   ```
2. Add tasks, handlers, and variables as needed.

---

## 🧩 Variables

### Global Variables:
- `backup_dir`: Directory for storing backups.
- `home`: User's home directory.
- `user`: Username for tasks.

### Role-Specific Variables:
- **`install_docker`**:
  - `docker_keys`: URL for Docker GPG keys.
  - `docker_keyring`: Path to Docker keyring.

---

## 🧪 Testing

Run the test playbook to validate configurations:
```bash
ansible-playbook test-playbook.yaml --check
```

---

## 📄 License

This project is licensed under the **MIT License**. See the LICENSE file for details.

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your message"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request.

---

## 📧 Contact

For questions or support, feel free to reach out:
- **Email**: your-email@example.com
- **GitHub**: [zelinar](https://github.com/zelinar)

---

## 🌟 Acknowledgments

Special thanks to:
- The Ansible community for their amazing tools.
- Open-source contributors for their support.

---
