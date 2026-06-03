# Role: configure_hosts_file

## 📖 Overview
This role is responsible for configuring the `/etc/hosts` file on target nodes. It ensures that all Kubernetes control plane and worker nodes are properly listed in the hosts file, enabling seamless communication within the cluster.

---

## ⚙️ Requirements
- **Supported OS**: Linux-based systems
- **Dependencies**: None
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name | Default Value | Description                          |
|---------------|---------------|--------------------------------------|
| `hosts_dest`  | `/etc/hosts`  | Path to the hosts file on the target nodes. |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Configure /etc/hosts file
  hosts: all
  roles:
    - role: configure_hosts_file
      vars:
        hosts_dest: /etc/hosts
```

---

## 🛠️ Example Playbook
```yaml
- name: Configure hosts file for Kubernetes cluster
  hosts: all
  gather_facts: true
  roles:
    - role: configure_hosts_file
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: (https://github.com/zelinar)
```
