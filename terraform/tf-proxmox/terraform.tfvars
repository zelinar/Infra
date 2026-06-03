pm_api_url     = "https://10.10.20.20:8006/api2/json"
pm_api_token_id = "root@pam!root-token"
pm_api_token_secret = "c399f294-89a9-4a90-a3c7-38ac066503e6"

vm_groups = {
  k8s-management-cluster = {
    target_node   = "homelab-server"
    template_name = "ubuntu25-server-template"
    gateway       = "10.10.20.1"
    disk_size_gb  = 500
    memory_mb     = 4096
    onboot        = true
    vms = [
      { name = "k8s-management-control-plane", ip = "10.10.20.110" },
      { name = "k8s-management-worker-node01", ip = "10.10.20.111" },
      { name = "k8s-management-worker-node02", ip = "10.10.20.112" },
      { name = "k8s-management-worker-node03", ip = "10.10.20.113" },
    ]
  },

  k8s-workload-cluster-dev = {
    target_node   = "homelab-server"
    template_name = "ubuntu25-server-template"
    gateway       = "10.10.20.1"
    disk_size_gb  = 500
    memory_mb     = 4096
    onboot        = true
    vms = [
      { name = "k8s-workload-dev-control-plane", ip = "10.10.20.120" },
      { name = "k8s-workload-dev-worker-node01", ip = "10.10.20.121" },
      { name = "k8s-workload-dev-worker-node02", ip = "10.10.20.122" },
      { name = "k8s-workload-dev-worker-node03", ip = "10.10.20.123" },
    ]
  },

  k8s-workload-cluster-prod= {
    target_node   = "homelab-server"
    template_name = "ubuntu25-server-template"
    gateway       = "10.10.20.1"
    disk_size_gb  = 500
    memory_mb     = 6144
    onboot        = true
    vms = [
      { name = "k8s-workload-prod-control-plane", ip = "10.10.20.130" },
      { name = "k8s-workload-prod-worker-node01", ip = "10.10.20.131" },
      { name = "k8s-workload-prod-worker-node02", ip = "10.10.20.132" },
      { name = "k8s-workload-prod-worker-node03", ip = "10.10.20.133" },
    ]
  },

   k8s-monitoring-cluster= {
    target_node   = "homelab-server"
    template_name = "ubuntu25-server-template"
    gateway       = "10.10.20.1"
    disk_size_gb  = 500
    memory_mb     = 6144
    onboot        = true
    vms = [
      { name = "k8s-monitoring-control-plane", ip = "10.10.20.140" },
      { name = "k8s-monitoring-worker-node01", ip = "10.10.20.141" },
      { name = "k8s-monitoring-worker-node02", ip = "10.10.20.142" },
      { name = "k8s-monitoring-worker-node03", ip = "10.10.20.143" },
    ]
  } 
}

