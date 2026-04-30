terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 3.0.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "linux_vm" {
  count       = var.vm_count
  name        = "${var.vm_name_prefix}-${count.index + 1}"
  target_node = var.pm_node
  clone       = var.template_name

  os_type   = "cloud-init"
  cores     = var.vm_cores
  sockets   = 1
  memory    = var.vm_memory_mb
  scsihw    = "virtio-scsi-pci"
  agent     = 1

  disk {
    size    = var.vm_disk_gb
    type    = "scsi"
    storage = var.vm_storage
  }

  network {
    model  = "virtio"
    bridge = var.vm_bridge
  }

  ipconfig0 = "ip=${var.vm_network_cidr},gw=${var.vm_gateway}"

  ssh_user        = var.ssh_user
  ssh_private_key = file(var.ssh_private_key_path)

  ciuser  = var.ssh_user
  cipassword = var.ci_password

  tags = [
    "env=${var.environment}",
    "role=linux-server"
  ]
}
