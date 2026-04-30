output "vm_names" {
  description = "Names of created VMs"
  value       = [for vm in proxmox_vm_qemu.linux_vm : vm.name]
}

output "vm_ids" {
  description = "VM IDs"
  value       = [for vm in proxmox_vm_qemu.linux_vm : vm.vm_id]
}
