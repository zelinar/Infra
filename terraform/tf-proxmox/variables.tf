variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

variable "pm_tls_insecure" {
  type    = bool
  default = true
}

variable "target_node" {
  type = string
}

variable "template_name" {
  type = string
}

variable "vms" {
  description = "List of objects with name and ip for each VM"
  type = list(object({
    name = string
    ip   = string
  }))
}

variable "cpu_type" {
  type    = string
  default = "host"
}

variable "cores" {
  type    = number
  default = 2
}

variable "sockets" {
  type    = number
  default = 1
}

variable "memory_mb" {
  type    = number
  default = 2048
}

variable "scsihw" {
  type    = string
  default = "virtio-scsi-pci"
}

variable "bootdisk" {
  type    = string
  default = "scsi0"
}

variable "boot_order" {
  type    = string
  default = "order=scsi0"
}

variable "os_type" {
  type    = string
  default = "cloud-init"
}

variable "disk_size_gb" {
  type    = number
  default = 25
}

variable "disk_storage" {
  type    = string
  default = "VM-storage"
}

variable "net_model" {
  type    = string
  default = "virtio"
}

variable "net_bridge" {
  type    = string
  default = "vmbr0"
}

variable "net_cidr" {
  type    = string
  default = "24"
}

variable "gateway" {
  type    = string
  default = "10.10.20.1"
}
