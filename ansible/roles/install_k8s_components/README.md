# Role: install_k8s_components

## 📖 Overview
This role installs and configures the necessary Kubernetes components (`kubeadm`, `kubectl`, and `kubelet`) on the target nodes. It ensures that the Kubernetes packages are installed with the correct versions and prepares the nodes for cluster initialization.

---

## ⚙️ Requirements
- **Supported OS**: Ubuntu 20.04, Debian 10+
- **Dependencies**:
  - Container runtime (e.g., `containerd`) must be installed and configured.
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name        | Default Value                                   | Description                                      |
|----------------------|-------------------------------------------------|------------------------------------------------|
| `k8s_repo_version`   | `v1.33`                                        | Kubernetes repository version.                 |
| `k8s_version`        | `1.33.3-1.1`                                   | Kubernetes package version to install.         |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Install Kubernetes components
  hosts: all
  roles:
    - role: install_k8s_components
      vars:
        k8s_repo_version: v1.33
        k8s_version: 1.33.3-1.1
```

---

## 🛠️ Example Playbook
```yaml
- name: Install Kubernetes components
  hosts: all
  gather_facts: true
  roles:
    - role: install_k8s_components
      vars:
        k8s_repo_version: v1.33
        k8s_version: 1.33.3-1.1
```

---

## 🔗 Dependencies
This role depends on the following:
- `install_containerd`: Ensures the container runtime is installed and configured.

---

## 📝 Tasks Overview
1. **Remove Existing Kubernetes Keys and Repositories**:
   - Removes old Kubernetes GPG keys and repositories if they exist.
2. **Add Kubernetes Repository**:
   - Adds the official Kubernetes repository and its GPG key.
3. **Install Kubernetes Packages**:
   - Installs `kubeadm`, `kubectl`, and `kubelet` with the specified versions.
4. **Prevent Automatic Updates**:
   - Ensures that Kubernetes packages are held to prevent unintended upgrades.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: (https://github.com/zelinar)
```

