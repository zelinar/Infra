# Role: argocd_prerequisites

## 📖 Overview
This role prepares the Kubernetes nodes for deploying **ArgoCD** by pre-pulling necessary container images. It ensures that the required images are available on all nodes to optimize the deployment process and reduce startup time.

---

## ⚙️ Requirements
- **Supported OS**: Linux-based systems with Kubernetes installed.
- **Dependencies**:
  - Kubernetes cluster must be initialized and accessible.
  - `ctr` (Containerd CLI) must be installed and configured on all nodes.

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name      | Default Value | Description                          |
|--------------------|---------------|--------------------------------------|
| `argocd_version`   | `v3.3.6`      | The version of ArgoCD to pre-pull.   |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Prepare nodes for ArgoCD deployment
  hosts: all
  roles:
    - role: argocd_prerequisites
      vars:
        argocd_version: v3.3.6
```

---

## 🛠️ Example Playbook
```yaml
- name: Deploy ArgoCD prerequisites
  hosts: all
  gather_facts: true
  roles:
    - role: argocd_prerequisites
      vars:
        argocd_version: v3.3.6
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **GitHub**: [zelinar](https://github.com/zelinar)
```
