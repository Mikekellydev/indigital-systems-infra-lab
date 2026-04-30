# VMware to Proxmox Migration Notes

## Context
Due to Broadcom's VMware licensing changes, we are evaluating Proxmox VE as a cost-effective, open platform.

## High-Level Migration Phases

1. **Discovery**
   - Inventory existing ESXi VMs (CPU, RAM, disk, OS, IPs, dependencies).
   - Classify workloads: stateless, stateful, mission-critical.

2. **Design**
   - Proxmox cluster layout (nodes, storage, networking).
   - Decide on storage: ZFS, Ceph, or existing SAN.
   - Define standard VM sizes and templates.

3. **Build**
   - Deploy Proxmox cluster.
   - Create cloud-init templates.
   - Integrate with Terraform and Ansible (this repo).

4. **Migrate**
   - Use Proxmox's built-in ESXi import or V2V tools.
   - Start with non-critical workloads.
   - Validate performance and functionality.

5. **Cutover**
   - Schedule maintenance windows.
   - Migrate mission-critical workloads.
   - Update DNS, monitoring, and backup targets.

6. **Decommission**
   - Retire ESXi hosts.
   - Update documentation and CMDB.

## Automation Touchpoints

- Terraform: Proxmox VM lifecycle.
- Ansible: OS baseline, NGINX, MySQL, monitoring agents.
- Future: Proxmox API scripts for health checks and reporting.

This document shows readiness to support and lead a VMware → Proxmox transition.
