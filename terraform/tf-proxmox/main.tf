terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "= 3.0.2-rc03 "
    }
  }
}

 provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
#   pm_api_token_id = "terraform@pve!terraform-token"
#   pm_api_token_secret = "a5ab4f29-a815-4618-8e78-ce9c4c9a9f6e"
  pm_tls_insecure = var.pm_tls_insecure
}

locals {
  # Map of VM definitions: name -> ip
  vms = { for vm in var.vms : vm.name => vm }
}

resource "proxmox_vm_qemu" "ubuntu"{
  for_each    = local.vms 
  name        = each.value.name
  target_node = var.target_node
  clone       = var.template_name
  full_clone  = true


  #name        = "ubuntu-vm01"
  #target_node = var.target_node
  #clone       = var.template_name   # cloud-init template name
  #full_clone  = true
  agent       = 1
  skip_ipv6 = true
  

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = var.cpu_type
  }
  
  
  memory      = var.memory_mb
  scsihw      = var.scsihw
  bootdisk    = var.bootdisk
  boot        = var.boot_order

  # Must specify root drive and cloudinit
  disks {
        ide {
            ide0 {
                cloudinit {
                    storage = var.disk_storage
                }
              }
        } 
        scsi {
          scsi0 {
             disk {
                size    = var.disk_size_gb
                storage  = var.disk_storage
             }
            
                }      
             }  
        }
        
      
  network {
    id = 0
    model    = var.net_model
    bridge   = var.net_bridge
  }

  os_type = var.os_type
  #CIDR notation
  ipconfig0 = "ip=${each.value.ip}/${var.net_cidr},gw=${var.gateway}"

} 
  