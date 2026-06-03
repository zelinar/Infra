# Role: set_hostname

## 📖 Overview
This role sets the hostname of the target nodes to match their inventory name. It ensures that the hostname is updated both in the system configuration and in the `/etc/hostname` file.

---

## ⚙️ Requirements
- **Supported OS**: Linux-based systems
- **Dependencies**: None
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name      | Default Value      | Description                          |
|--------------------|--------------------|--------------------------------------|
| `hostname_path`    | `/etc/hostname`    | Path to the hostname configuration file. |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Set hostnames for all nodes
  hosts: all
  roles:
    - role: set_hostname
      vars:
        hostname_path: /etc/hostname
```

---

## 🛠️ Example Playbook
```yaml
- name: Configure hostnames
  hosts: all
  gather_facts: true
  roles:
    - role: set_hostname
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📝 Tasks Overview
1. **Set Hostname**:
   - Updates the system hostname to match the `inventory_hostname`.
2. **Update `/etc/hostname`**:
   - Ensures the hostname is written to the `/etc/hostname` file.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: [zelinar](https://github.com/zelinar)
```

