# Variable Definitions
variable "proxmox_api_url" {
    type = string
    default = null
}

variable "proxmox_api_token_id" {
    type = string
    default = null
}

variable "proxmox_api_token_secret" {
    type      = string
    sensitive = true
    default = null
}

variable "skip_tls" {
    type = bool
    default = true
}

#VM settings
variable "proxmox_node" {
    type = string
    default = "homelab-server"
}

variable "vm_id" {
    type = string
    default = "150"
}

variable "template_name" {
    type = string
    default = "ubuntu25-server-template"
}

variable "template_description" {
    type = string
    default = "Ubuntu24 cloud-init ready (built by Packer)"
}

variable "iso_type" {
    type = string
    default = "scsi"
}

variable "iso_file" {
    type = string
    default = "VM-storage:iso/ubuntu25.iso"
}

variable "unmount" {
    type = bool
    default = true
}

variable "iso_checksum" {
    type = string
    default = "d6dab0c3a657988501b4bd76f1297c053df710e06e0c3aece60dead24f270b4d"
}

variable "qemu_agent" {
    type = bool
    default = true
}

#VM HW settings
variable "scsi_controller" {
    type = string
    default = "virtio-scsi-pci"
}

variable "disk_size" {
    type = string
    default = "25G"
}

variable "disk_format" {
    type = string
    default = "qcow2"
}

variable "storage_pool" {
    type = string
    default = "VM-storage"
}

variable "disk_type" {
    type = string
    default = "scsi"
}

variable "cpu_cores" {
    type = number
    default = 2
}

variable "memory" {
    type = number
    default = 2048
}

#VM Cloud-Init Settings
variable "cloud_init_enabled" {
    type = bool
    default = true
}

variable "cloud_init_storage" {
    type = string
    default = "VM-storage"
}

#VM Network settings
variable "network_model" {
    type = string
    default = "virtio"
}

variable "network_bridge" {
    type = string
    default = "vmbr0"
}

variable "firewall" {
    type = bool
    default = false
}

# PACKER Autoinstall Settings
variable "http_dir" {
    type = string
    default = "http"
}

# (Optional) Bind IP Address and Port to packer httpd server on which it serves cloud-init config - same as IP of machine from you run packer
# must be reachable from vlan where you deploying packer image
variable "http_ip" {
    type = string
    default = "10.10.10.10"
}

variable "http_port_min" {
    type = number
    default = 8802
}

variable "http_port_max" {
    type = number
    default = 8804
}

# Credentials
variable "ssh_username" {
    type = string
    default = "ansible"
}

variable "ssh_psw" {
    type = string
    default = "Ansible-23!"
    sensitive = true
}
