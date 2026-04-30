variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_user" {
  description = "Proxmox API user"
  type        = string
}

variable "pm_password" {
  description = "Proxmox API password"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Allow insecure TLS"
  type        = bool
  default     = true
}

variable "pm_node" {
  description = "Proxmox node name"
  type        = string
}

variable "template_name" {
  description = "Cloud-init template name to clone"
  type        = string
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "indigital-linux"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "vm_cores" {
  description = "vCPU cores per VM"
  type        = number
  default     = 2
}

variable "vm_memory_mb" {
  description = "Memory in MB per VM"
  type        = number
  default     = 4096
}

variable "vm_disk_gb" {
  description = "Disk size in GB"
  type        = number
  default     = 40
}

variable "vm_storage" {
  description = "Proxmox storage name"
  type        = string
  default     = "local-lvm"
}

variable "vm_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "vm_network_cidr" {
  description = "IP with CIDR for cloud-init (e.g. 192.168.10.50/24)"
  type        = string
}

variable "vm_gateway" {
  description = "Gateway IP"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for cloud-init"
  type        = string
  default     = "ubuntu"
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key"
  type        = string
}

variable "ci_password" {
  description = "Cloud-init user password (optional)"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment tag (dev, prod, etc.)"
  type        = string
  default     = "dev"
}
