# Proxmox Cloud-Init Template

## Goal
Standardize Linux VM provisioning for Ansible-managed systems.

## Steps

1. Upload Ubuntu cloud image (e.g. `ubuntu-22.04-server-cloudimg-amd64.img`) to Proxmox storage.
2. Create a new VM using the image as a disk.
3. Enable cloud-init:
   - Add a cloud-init drive.
   - Set boot order to use the cloud-init disk.
4. Convert the VM to a template.
5. Use `template_name` in Terraform to clone from this template.

This template is the base for all `linux_servers` managed by Ansible.
