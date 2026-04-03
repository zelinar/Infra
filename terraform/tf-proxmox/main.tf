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
  pm_tls_insecure = var.pm_tls_insecure
}

locals {
  # Flatten VM definitions
  vms = {
    for vm in flatten([
      for group_name, group in var.vm_groups : [
        for vm in group.vms : {
          name         = vm.name
          ip           = vm.ip
          group        = group_name
          target_node  = group.target_node
          template     = group.template_name
          gateway      = group.gateway
          disk_size_gb = group.disk_size_gb
          memory_mb    = group.memory_mb
          onboot       = group.onboot 
        }
      ]
    ]) : vm.name => vm
  }  
}

resource "proxmox_vm_qemu" "ubuntu"{
  for_each    = local.vms 
  name        = each.value.name
  target_node = each.value.target_node
  clone       = each.value.template
  full_clone  = var.full_clone
 
  agent       = var.agent
  skip_ipv6   = var.skip_ipv6
  

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = var.cpu_type
  }
  
  
  memory      = each.value.memory_mb
  scsihw      = var.scsihw
  bootdisk    = var.bootdisk
  boot        = var.boot_order
  onboot      = each.value.onboot

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
                size    = each.value.disk_size_gb
                storage  = var.disk_storage
             }
            
                }      
             }  
        }
        
      
  network {
    id       = var.net_id
    model    = var.net_model
    bridge   = var.net_bridge
  }

  os_type = var.os_type

  #CIDR notation
  ipconfig0 = "ip=${each.value.ip}/${var.net_cidr},gw=${var.gateway}"

} 
  