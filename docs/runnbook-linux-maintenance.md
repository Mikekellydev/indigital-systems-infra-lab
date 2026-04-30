# Runbook: Linux Server Maintenance

## Purpose
Provide a standardized procedure for performing scheduled maintenance on Linux servers managed by Ansible.

---

## 1. Pre‑Maintenance Checklist

- Confirm maintenance window approval
- Notify stakeholders (Slack + email)
- Validate recent backups
- Review monitoring dashboards for anomalies
- Ensure Ansible inventory is up to date

---

## 2. Apply Updates

Run baseline role:

ansible-playbook ansible/playbooks/baseline.yml -i ansible/inventories/prod/hosts.ini


This performs:

- package updates  
- security patches  
- UFW validation  
- MOTD deployment  
- timezone enforcement  

---

## 3. Reboot (If Required)

Check if a reboot is needed:
needs-restarting -r


If yes:

ansible all -i inventories/prod/hosts.ini -m reboot


---

## 4. Post‑Maintenance Validation

- Verify services (NGINX, MySQL)
- Check Prometheus for:
  - CPU spikes
  - Load average
  - Disk usage
  - Node exporter availability
- Review logs:
  - `/var/log/syslog`
  - `/var/log/auth.log`

---

## 5. Close Out

- Update change ticket
- Notify stakeholders
- Document any anomalies

---

This runbook ensures consistent, safe, and auditable maintenance operations.
