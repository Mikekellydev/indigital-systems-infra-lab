# Incident Response Example

## Incident Summary
**Date:** 2026‑04‑28  
**Severity:** High  
**System:** Linux VM (prod-linux-1)  
**Impact:** Web application unavailable for 7 minutes  

---

## 1. Detection

Prometheus alert fired:

- **Alert:** NodeExporterDown  
- **Instance:** prod-linux-1  
- **Time:** 14:03 EDT  

Grafana dashboard confirmed no metrics for the node.

---

## 2. Containment

- Verified VM was reachable via Proxmox console
- Restarted node_exporter service:
systemctl restart node_exporter
- Service restored immediately

---

## 3. Root Cause Analysis

**Cause:**  
Node exporter failed due to a corrupted binary after an interrupted package update.

**Contributing Factors:**

- Maintenance window earlier in the day  
- Update process interrupted by a user session timeout  

---

## 4. Corrective Actions

- Reinstalled node exporter via Ansible baseline role  
- Added health check alert for node_exporter service  
- Updated maintenance runbook to include service validation step  

---

## 5. Preventive Actions

- Implemented `systemd` watchdog for node_exporter  
- Added Prometheus alert for missing metrics > 60 seconds  

---

## 6. Resolution Time

- Detection: 14:03  
- Containment: 14:05  
- Full resolution: 14:10  

Total: **7 minutes**

---

This incident demonstrates structured response, root cause analysis, and preventive improvements.
