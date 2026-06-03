# Role: install_prerequisites

## 📖 Overview
This role ensures that all necessary prerequisites are installed and configured on the target nodes. It disables automatic updates, installs essential packages, and prepares the system for further configuration.

---

## ⚙️ Requirements
- **Supported OS**: Ubuntu 20.04, Debian 10+
- **Dependencies**: None
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name | Default Value | Description                          |
|---------------|---------------|--------------------------------------|
| None          | -             | This role does not use any variables by default. |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Install prerequisites on all nodes
  hosts: all
  roles:
    - role: install_prerequisites
```

---

## 🛠️ Example Playbook
```yaml
- name: Prepare nodes with prerequisites
  hosts: all
  gather_facts: true
  roles:
    - role: install_prerequisites
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📝 Tasks Overview
1. **Disable Automatic Updates**:
   - Stops and disables the `unattended-upgrades` service.
   - Disables `apt-daily` and `apt-daily-upgrade` timers.
2. **Wait for APT/Dpkg Lock**:
   - Ensures that no other processes are holding the APT/Dpkg lock before proceeding.
3. **Install Essential Packages**:
   - Installs packages such as `curl` and other required utilities.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: (https://github.com/zelinar)
```
