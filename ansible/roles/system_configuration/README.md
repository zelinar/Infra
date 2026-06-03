# Role: system_configuration

## 📖 Overview
This role configures essential system settings on Kubernetes nodes to ensure compatibility with Kubernetes and optimal performance. It includes tasks such as disabling swap, setting kernel parameters, and configuring network settings.

---

## ⚙️ Requirements
- **Supported OS**: Linux-based systems (Ubuntu, Debian)
- **Dependencies**: None
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name      | Default Value                              | Description                                      |
|--------------------|--------------------------------------------|------------------------------------------------|
| `modules_conf`     | `/etc/modules-load.d/containerd.conf`      | Path to the kernel modules configuration file. |
| `network_conf`     | `/etc/sysctl.d/99-disable-ipv6.conf`       | Path to the network configuration file.        |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Configure system settings for Kubernetes
  hosts: all
  roles:
    - role: system_configuration
      vars:
        modules_conf: /etc/modules-load.d/custom-containerd.conf
        network_conf: /etc/sysctl.d/custom-network.conf
```

---

## 🛠️ Example Playbook
```yaml
- name: Apply system configuration
  hosts: all
  gather_facts: true
  roles:
    - role: system_configuration
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📝 Tasks Overview
1. **Set Timezone**:
   - Configures the system timezone (e.g., `Europe/Prague`).
2. **Disable Swap**:
   - Disables swap temporarily and permanently by modifying `/etc/fstab`.
3. **Load Kernel Modules**:
   - Loads required kernel modules (`br_netfilter`, `overlay`) and ensures they are loaded on boot.
4. **Configure Network Settings**:
   - Applies network settings such as enabling IPv4 forwarding and disabling IPv6.
5. **Apply Kernel Parameters**:
   - Applies the configured kernel parameters using `sysctl`.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: [zelinar](https://github.com/zelinar)
```
