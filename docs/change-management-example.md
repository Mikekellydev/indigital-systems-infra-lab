# Change Management Example

## Change ID
CHG‑2026‑0429‑NGINX‑TLS

## Title
Deploy updated TLS configuration to NGINX servers via Ansible

---

## Summary
Update NGINX configuration to enforce modern TLS settings and security headers.

---

## Risk Assessment

| Risk | Level | Mitigation |
|------|-------|------------|
| Service restart required | Medium | Apply during maintenance window |
| Misconfiguration could break HTTPS | High | Validate config with `nginx -t` before reload |
| Rollback needed | Low | Template versioning + backup |

---

## Implementation Steps

1. Update `nginx.conf.j2` template  
2. Run syntax validation:

ansible-playbook webserver.yml --check

3. Apply changes:

ansible-playbook webserver.yml

4. Validate:
- `curl -I https://site`
- Check Grafana for traffic anomalies  
- Confirm Prometheus scrape success  

---

## Rollback Plan

- Restore previous template from Git  
- Re-run playbook  
- Validate service health  

---

## Approval

- Infrastructure Lead  
- Security Officer  
- Application Owner  

---

## Status
**Completed successfully.**
