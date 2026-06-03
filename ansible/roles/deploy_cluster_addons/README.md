# Role: deploy_cluster_addons

## 📖 Overview
This role is responsible for deploying essential Kubernetes cluster addons, including **ArgoCD** and other necessary tools. It ensures that the cluster is equipped with the required addons for managing applications and configurations.

---

## ⚙️ Requirements
- **Supported OS**: Linux-based systems with Kubernetes installed.
- **Dependencies**:
  - Kubernetes cluster must be initialized and accessible.
  - `kubectl` and `helm` must be installed on the control node.
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name              | Default Value                                         | Description                                      |
|----------------------------|-----------------------------------------------------|------------------------------------------------|
| `home_owner`               | `martin`                                            | Owner of the home directory for kubeconfig.    |
| `kubeconfig_path`          | `/home/martin/.kube/admin_k8s-workload-dev-control-plane.conf` | Path to the kubeconfig file.                   |
| `argocd_values`            | `/home/martin/Documents/INFRA/git/Helm_Charts/argocd/values.yaml` | Path to ArgoCD Helm values file.               |
| `argocd_chart`             | `/home/martin/Documents/INFRA/git/Helm_Charts/argocd/` | Path to the ArgoCD Helm chart.                 |
| `argo_root_app_chart`      | `/home/martin/Documents/INFRA/git/Helm_Charts/argocd/core-services-root-app` | Path to the ArgoCD root app chart.             |
| `argo_root_app_values`     | `/home/martin/Documents/INFRA/git/Helm_Charts/argocd/core-services-root-app/values.yaml` | Path to the ArgoCD root app values file.       |
| `argocd_namespace`         | `argocd`                                            | Namespace where ArgoCD will be deployed.       |
| `argocd_admin_password`    | `argo`                                              | Admin password for ArgoCD.                     |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Deploy Kubernetes cluster addons
  hosts: control_plane, workers
  roles:
    - role: deploy_cluster_addons
      vars:
        kubeconfig_path: 

admin_k8s-workload-dev-control-plane.conf


        argocd_admin_password: my-secure-password
```

---

## 🛠️ Example Playbook
```yaml
- name: Deploy cluster addons
  hosts: control_plane, workers
  gather_facts: true
  roles:
    - role: deploy_cluster_addons
      vars:
        kubeconfig_path: 

admin_k8s-workload-dev-control-plane.conf


        argocd_admin_password: my-secure-password
```

---

## 🔗 Dependencies
This role has no external dependencies.

---

## 📝 Tasks Overview
1. **Deploy ArgoCD**:
   - Uses Helm to deploy ArgoCD to the specified namespace.
   - Waits for ArgoCD pods to be in a running state.
2. **Configure ArgoCD Admin Password**:
   - Generates a bcrypt hash for the admin password.
   - Updates the ArgoCD secret with the new password.
   - Restarts the ArgoCD server to apply the changes.
3. **Deploy ArgoCD Root Application**:
   - Deploys the ArgoCD root application using Helm.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **Author**: Your Name
- **GitHub**: [Your GitHub Profile](https://github.com/your-profile)
```

### Explanation:
1. **Overview**: Describes the purpose of the role.
2. **Requirements**: Lists prerequisites for using the role.
3. **Role Variables**: Documents the variables used in the role.
4. **Usage**: Provides an example of how to include the role in a playbook.
5. **Example Playbook**: Demonstrates a complete playbook using the role.
6. **Dependencies**: Notes any external dependencies (none in this case).
7. **Tasks Overview**: Summarizes the key tasks performed by the role.
8. **License**: Mentions the license under which the role is distributed.
9. **Author Information**: Provides a placeholder for the author's details.

