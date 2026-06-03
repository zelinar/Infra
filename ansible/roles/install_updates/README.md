# Role: install_updates

## 📖 Overview
This role ensures that all the latest updates and patches are installed on the target nodes. It also handles reboots if required and logs the update results for auditing purposes.

---

## ⚙️ Requirements
- **Supported OS**: Ubuntu 20.04, Debian 10+
- **Dependencies**: None
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name      | Default Value                  | Description                          |
|--------------------|--------------------------------|--------------------------------------|
| `linux_log_path`   | `/tmp/ansible/ansible_update.txt` | Path to the log file for update results. |
| `linux_log_folder` | `/tmp/ansible/`               | Directory to store log files.        |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Install updates on all nodes
  hosts: all
  roles:
    - role: install_updates
      vars:
        linux_log_path: /var/log/ansible_update.log
        linux_log_folder: /var/log/ansible/
```

---

## 🛠️ Example Playbook
```yaml
- name: Apply updates and patches
  hosts: all
  gather_facts: true
  roles:
    - role: install_updates
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📝 Tasks Overview
1. **Install Latest Updates**:
   - Installs all the latest available updates using the package manager.
2. **Log Update Results**:
   - Logs the results of the update process to a specified file for auditing.
3. **Check for Reboot Requirement**:
   - Checks if a reboot is required after updates.
4. **Reboot Nodes**:
   - Reboots the nodes if necessary and notifies the user.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: (https://github.com/zelinar)
```
