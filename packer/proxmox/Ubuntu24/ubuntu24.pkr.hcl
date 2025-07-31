# Ubuntu24 server 
# ---
# Packer Template to create an Ubuntu24 Server  on Proxmox

# Proxmomx plugin - run packer init to install it
packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

# Variable Definitions
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type      = string
    sensitive = true
}

locals {
    disk_storage = "local-lvm"
}

# Resource Definiation for the VM Template
source "proxmox-iso" "ubuntu24" {

    # Proxmox Connection Settings
    proxmox_url = "${var.proxmox_api_url}"
    username    = "${var.proxmox_api_token_id}"
    token       = "${var.proxmox_api_token_secret}"
    # (Optional) Skip TLS Verification
    insecure_skip_tls_verify = true

    # VM General Settings
    node                 = "homelab-server"
    vm_id                = "150"
    vm_name              = "ubuntu24-server"
    template_description = "Ubuntu24 Server Image"

    # VM OS Settings
    # (Option 1) Local ISO File
    boot_iso {
        type         = "scsi"
        iso_file     = "VM-storage:iso/ubuntu24-server.iso"
        unmount      = true
        iso_checksum = "d6dab0c3a657988501b4bd76f1297c053df710e06e0c3aece60dead24f270b4d"
    # }
    # (Option 2) Download ISO
    # boot_iso {
    #     type             = "scsi"
    #     iso_url          = "https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso"
    #     unmount          = true
    #     iso_storage_pool = "local"
    #     iso_checksum     = "file:https://releases.ubuntu.com/focal/SHA256SUMS"
     }

    # VM System Settings
    qemu_agent = true

    # VM HW Settings
    scsi_controller = "virtio-scsi-pci"
    disks {
        disk_size         = "25G"
        format            = "qcow2"
        storage_pool      = "VM-storage"
        type              = "scsi"
    }
    # CPU and memory
    cores = "4"
    memory = "4096"

    # VM Network Settings
    network_adapters {
        model    = "virtio"
        bridge   = "vmbr0"
        firewall = "false"
    }

    # VM Cloud-Init Settings
    cloud_init              = true
    cloud_init_storage_pool = "VM-storage"
    
    
    # PACKER Boot Commands
    boot         = "c"
    boot_wait    = "5s"
    boot_command = [
        "c<wait>",
         "linux /casper/vmlinuz autoinstall ds=\"nocloud;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\"<enter><wait>",
         "initrd /casper/initrd<enter><wait>",
         "boot<enter><wait>"
       ]

    # Useful for debugging
    # Sometimes lag will require this
    # boot_key_interval = "500ms"

    # PACKER Autoinstall Settings
    http_directory = "http"

    # (Optional) Bind IP Address and Port
      http_bind_address = "10.10.10.10"
      http_port_min     = 8802
      http_port_max     = 8802

    ssh_username = "ansible"
    # (Option 1) Add your Password here
    ssh_password = "Ansible-23!"

    # - or -
    # (Option 2) Add your Private SSH KEY file here
    # ssh_private_key_file = "~/.ssh/id_rsa"

    # Raise the timeout, when installation takes longer
    ssh_timeout = "20m"
}

# Build Definition to create the VM Template
build {

    name    = "ubuntu24-server"
    sources = ["source.proxmox-iso.ubuntu24"]

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
    provisioner "shell" {
        inline = [
            #"echo 'network:\n  version: 2\n  ethernets:\n    ens18: {}' | echo 'Ansible-23!' | sudo -S tee /etc/netplan/50-cloud-init.yaml",
            #"echo 'Ansible-23!' | sudo -S netplan apply"
            "echo 'Ansible-23!' | sudo -S  rm -f /etc/netplan/50-cloud-init.yaml",
            "echo 'Ansible-23!' | sudo -S  cloud-init clean",
            "echo 'Ansible-23!' | sudo -S  truncate -s 0 /etc/machine-id"
        ]
    }

    # provisioner "shell" {
    #     inline = [
    #        "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
    #         "sudo rm /etc/ssh/ssh_host_*",
    #         "sudo truncate -s 0 /etc/machine-id",
    #         "sudo apt -y autoremove --purge",
    #         "sudo apt -y clean",
    #         "sudo apt -y autoclean",
    #         "sudo cloud-init clean",
    #         "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
    #         "sudo rm -f /etc/netplan/00-installer-config.yaml",
    #         "sudo sync" 
    #     ]
    # }

    # # Provisioning the VM Template for Cloud-Init Integration in Proxmox #2
    # provisioner "file" {
    #     source      = "files/99-pve.cfg"
    #     destination = "/tmp/99-pve.cfg"
    # }

    # # Provisioning the VM Template for Cloud-Init Integration in Proxmox #3
    # provisioner "shell" {
    #     inline = [ "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg" ]
    # }

    # Add additional provisioning scripts here
    # ...
}