# OpenVAS Vulnerability Scan Summary

## Target
Linux Server: dev-linux-1  
Scan Date: 2026-04-30  
Scanner: OpenVAS (GVM)

---

## Executive Summary

| Severity | Count |
|---------|-------|
| High    | 1     |
| Medium  | 4     |
| Low     | 12    |
| Info    | 22    |

Overall Risk Rating: **Medium**

---

## High Severity Findings

### 1. Outdated OpenSSL Package
- **Description:** Installed version contains known vulnerabilities.
- **Impact:** Potential for MITM or remote code execution.
- **Remediation:**  
  - Apply security updates via Ansible baseline role  
  - Validate OpenSSL version post‑update  
  - Restart dependent services  

Status: **Resolved**

---

## Medium Severity Findings

### 1. SSH Weak MAC Algorithms Enabled
- **Remediation:** Update `/etc/ssh/sshd_config` via Ansible template.

### 2. Missing HTTP Security Headers (NGINX)
- **Remediation:** Add headers in NGINX template.

### 3. Unused Packages Installed
- **Remediation:** Remove via Ansible baseline role.

### 4. Kernel Not Updated
- **Remediation:** Apply updates and schedule controlled reboot.

Status: **In Progress**

---

## Low Severity Findings

- World‑writable temp directories  
- Missing MOTD banner  
- Minor sysctl hardening gaps  

Status: **Resolved via baseline