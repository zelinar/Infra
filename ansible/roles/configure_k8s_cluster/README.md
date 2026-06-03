
# Role: configure_k8s_cluster

## 📖 Overview
This role is responsible for initializing and configuring a Kubernetes cluster on the control plane and worker nodes. It sets up the cluster, applies the necessary configurations, and ensures that all nodes are properly joined to the cluster.

---

## ⚙️ Requirements
- **Supported OS**: Linux-based systems
- **Dependencies**:
  - Kubernetes packages (`kubeadm`, `kubectl`, `kubelet`) must be installed.
  - Container runtime (e.g., `containerd`) must be configured.
- **Ansible Version**: 2.9+

---

## 🧩 Role Variables
The following variables are used in this role. Customize them as needed in your playbook or inventory files.

| Variable Name         | Default Value                                   | Description                                      |
|-----------------------|-------------------------------------------------|--------------------------------------------------|
| `home_owner`          | `martin`                                       | The owner of the home directory for kubeconfig. |
| `ansible_home`        | `/home/ansible`                                | The home directory for the Ansible user.        |
| `kubernetes_folder`   | `/etc/kubernetes`                              | Path to Kubernetes configuration files.         |
| `calico_url`          | `https://raw.githubusercontent.com/projectcalico/calico/v3.32.0/manifests/calico.yaml` | URL for Calico CNI plugin.                      |
| `pod_cidr`            | `190.160.0.0/16`                               | CIDR for the Kubernetes pod network.            |
| `k8s_version`         | `1.33.3`                                       | Kubernetes version to initialize the cluster.   |

---

## 🚀 Usage
Here’s an example of how to use this role in your playbook:

```yaml
- name: Configure Kubernetes Cluster
  hosts: control_plane, workers
  roles:
    - role: configure_k8s_cluster
      vars:
        pod_cidr: 192.168.0.0/16
        k8s_version: 1.24.0
```

---

## 🛠️ Example Playbook
```yaml
- name: Initialize Kubernetes Cluster
  hosts: control_plane, workers
  gather_facts: true
  roles:
    - role: configure_k8s_cluster
      vars:
        pod_cidr: 192.168.0.0/16
        k8s_version: 1.24.0
```

---

## 🔗 Dependencies
This role depends on the following:
- `install_k8s_components`: Ensures Kubernetes packages are installed.
- `install_containerd`: Configures the container runtime.

---

## 📝 Tasks Overview
1. **Initialize Control Plane**:
   - Runs `kubeadm init` to initialize the control plane.
   - Configures the `.kube/config` file for the control plane.
2. **Configure Networking**:
   - Deploys the Calico CNI plugin for networking.
3. **Join Worker Nodes**:
   - Generates the `kubeadm join` command on the control plane.
   - Executes the join command on worker nodes to add them to the cluster.
4. **Fetch Kubeconfig**:
   - Copies the `admin.conf` file to the local machine for cluster management.

---

## 📜 License
This role is licensed under the **MIT License**. See the [LICENSE](../../LICENSE) file for details.

---

## 🤝 Author Information
- **GitHub**: [zelinar](https://github.com/zelinar)
```
