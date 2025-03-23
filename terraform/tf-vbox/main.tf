terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {
  # Configuration options
}

resource "virtualbox_vm" "control_plane" {  
  name      = "control_plane"
  #image     = "${path.module}/ubuntu.box.vdi"
  image     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-vagrant.box"
  #image     = "/home/martin/VMS/ubuntu.box/ubuntu.box.vdi"
  cpus      = 2
  memory    = "512 mib"
  

  network_adapter {
    type           = "bridged"
    host_interface = "eno2"
  }
}

resource "virtualbox_vm" "worker1" {  
  name      = "worker1"
  image     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-vagrant.box"
  cpus      = 2
  memory    = "512 mib"

  network_adapter {
    type           = "bridged"
    host_interface = "eno2"
  }
}

resource "virtualbox_vm" "worker2" {  
  name      = "worker2"
  image     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-vagrant.box"
  cpus      = 2
  memory    = "512 mib"

  network_adapter {
    type           = "bridged"
    host_interface = "eno2"
  }
}

output "IPAddr_1" {
  value = element(virtualbox_vm.control_plane.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.worker1.*.network_adapter.0.ipv4_address, 2)
}

output "IPAddr_3" {
  value = element(virtualbox_vm.worker2.*.network_adapter.0.ipv4_address, 3)
}
