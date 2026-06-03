# VM General Settings
variable "proxmox_node" {
  default = "pve"
}
variable "vm_id" {
  default = 9001
}
variable "template_name" {
  default = "rocky9-template"
}
variable "template_description" {
  default = "Rocky Linux 9 template created with Packer"
}

# VM OS Settings
variable "iso_type" {
  default = "iso"
}
variable "iso_file" {
  default = "VM-storage:iso/rocky9.iso"
}
variable "iso_checksum" {
  default = "sha256:your-rocky9-iso-checksum"
}
variable "unmount" {
  default = true
}

# VM System Settings
variable "qemu_agent" {
  default = true
}

# VM Hardware Settings
variable "scsi_controller" {
  default = "virtio-scsi-pci"
}
variable "disk_size" {
  default = "20G"
}
variable "disk_format" {
  default = "qcow2"
}
variable "storage_pool" {
  default = "local-lvm"
}
variable "disk_type" {
  default = "scsi"
}
variable "cpu_cores" {
  default = 2
}
variable "memory" {
  default = 2048
}

# VM Network Settings
variable "network_model" {
  default = "virtio"
}
variable "network_bridge" {
  default = "vmbr0"
}
variable "firewall" {
  default = false
}

# Cloud-Init Settings
variable "cloud_init_enabled" {
  default = true
}
variable "cloud_init_storage" {
  default = "local-lvm"
}