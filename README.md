# INDIGITAL Systems Infrastructure Engineer Lab

This repository demonstrates the daily responsibilities, tooling, and operational workflows of a Systems Infrastructure Engineer.  
It includes automation, virtualization, monitoring, security hardening, and documentation that mirrors real-world engineering practices.

The goal of this lab is to showcase technical depth, operational maturity, and an automation-first mindset aligned with mission‑critical infrastructure environments.

---

# 🚀 Quickstart

This lab runs on any Linux environment (Ubuntu, WSL2, or a VM).  
Follow the steps below to install dependencies, run automation, and launch the monitoring stack.

---

## **1. Install Dependencies**

### **Ansible**
```bash
sudo apt update
sudo apt install ansible -y

Terraform
bash

sudo apt install wget gpg -y
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform -y

Docker (optional, for Prometheus/Grafana)
bash

sudo apt install docker.io -y
sudo usermod -aG docker $USER

Log out and back in to apply group changes.
2. Run Ansible Automation
Apply Linux baseline configuration:
bash

ansible-playbook ansible/playbooks/baseline.yml -i ansible/inventories/dev/hosts.ini

Deploy NGINX web server:
bash

ansible-playbook ansible/playbooks/webserver.yml -i ansible/inventories/dev/hosts.ini

Deploy MySQL database server:
bash

ansible-playbook ansible/playbooks/database.yml -i ansible/inventories/dev/hosts.ini

3. Validate Terraform Configuration

Navigate to the Terraform directory:
bash

cd proxmox/terraform
terraform init
terraform validate
terraform plan

    Note: This repo uses example values for Proxmox credentials, IPs, and templates.
    Replace them in your private copy before running terraform apply.

4. Start the Monitoring Stack
Prometheus
bash

docker run -d \
  -p 9090:9090 \
  -v $(pwd)/monitoring/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus

Grafana
bash

docker run -d \
  -p 3000:3000 \
  grafana/grafana

Then open:

    Prometheus → http://localhost:9090

    Grafana → http://localhost:3000

Import the dashboard located at:
Code

monitoring/grafana/dashboards/linux-systems.json

5. Explore the Documentation

The docs/ directory includes:

    Architecture diagram

    Linux maintenance runbook

    Incident response example

    Change management example

These files demonstrate operational maturity and real-world engineering workflows.
📁 Repository Structure
Code

.
├── ansible/
│   ├── ansible.cfg
│   ├── group_vars/
│   ├── inventories/
│   ├── playbooks/
│   └── roles/
│
├── proxmox/
│   ├── terraform/
│   └── vm-templates/
│
├── monitoring/
│   ├── prometheus/
│   ├── grafana/
│   └── alerting/
│
├── security/
│   ├── hardening/
│   ├── vuln-scan/
│   └── certificates/
│
└── docs/

🛠️ Ansible Automation

This section includes:

    Linux baseline role

    NGINX deployment role

    MySQL provisioning role

    Environment-specific inventories

    Group variables

    Templates and handlers

These playbooks simulate real configuration management workflows used in production environments.
🧱 Proxmox IaC (Terraform)

The proxmox/terraform directory contains:

    VM provisioning using cloud-init templates

    Parameterized variables for CPU, memory, storage, and networking

    Output definitions for VM names and IDs

    A migration notes document for VMware → Proxmox transitions

This demonstrates infrastructure-as-code practices for virtualization platforms.
📊 Monitoring (Prometheus + Grafana)

The monitoring stack includes:

    Prometheus configuration

    Alert rules (CPU, disk, service health)

    Grafana dashboards for Linux systems

    Node exporter integration

This reflects real observability workflows for mission-critical systems.
🔐 Security

The security section includes:

    CIS-aligned Linux hardening checklist

    Vulnerability scan summary (OpenVAS)

    Certificate renewal automation script

    Secure operational practices

This demonstrates awareness of compliance, risk management, and secure operations.
📚 Documentation

The docs/ directory contains:

    Architecture diagram (Mermaid)

    Linux maintenance runbook

    Incident response example

    Change management example

These documents show communication clarity and operational discipline.
🎯 Purpose

This lab environment demonstrates readiness to step into a Systems Infrastructure Engineer role by showing:

    Technical depth

    Automation-first mindset

    Operational maturity

    Security awareness

    Clear communication

    Real-world engineering workflows