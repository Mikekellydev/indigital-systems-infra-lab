# CIS Linux Hardening Checklist (Operational Summary)

This checklist summarizes the hardening steps applied to Linux servers managed through Ansible.  
It is aligned with CIS Benchmarks for Ubuntu Server.

---

## 1. Account, Authentication & Authorization

- Enforce password complexity and expiration via `/etc/login.defs`
- Disable root SSH login
- Enforce key‑based SSH authentication
- Lock inactive accounts after 35 days
- Ensure sudo requires a password
- Configure `/etc/sudoers.d/` for least privilege

---

## 2. Filesystem & Permissions

- Set correct permissions on:
  - `/etc/passwd`
  - `/etc/shadow`
  - `/etc/group`
  - `/etc/gshadow`
- Disable unused filesystems (e.g., cramfs, udf)
- Enable nodev, nosuid, noexec on `/tmp` and `/var/tmp`

---

## 3. Logging & Auditing

- Ensure `rsyslog` is installed and enabled
- Configure log rotation under `/etc/logrotate.d/`
- Enable auditd with rules for:
  - privilege escalation
  - file permission changes
  - login/logout events
  - kernel module loading

---

## 4. Network Hardening

- Disable IPv6 if not required
- Disable uncommon network protocols
- Configure UFW:
  - Default deny inbound
  - Allow SSH only from trusted ranges
  - Allow app‑specific ports via Ansible

---

## 5. Services & Processes

- Remove unnecessary packages (e.g., telnet, rsh)
- Ensure NTP/chrony is configured
- Ensure unattended upgrades are enabled
- Verify only required services are enabled at boot

---

## 6. Kernel Hardening

- Apply sysctl settings:
  - Disable