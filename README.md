✨ Improved README.md
md

<p align="center">
  <img src="https://img.shields.io/badge/Ansible-Automation-blue">
  <img src="https://img.shields.io/badge/Terraform-IaC-5C4EE5">
  <img src="https://img.shields.io/badge/Proxmox-Virtualization-orange">
  <img src="https://img.shields.io/badge/Prometheus-Monitoring-E6522C">
  <img src="https://img.shields.io/badge/Grafana-Dashboards-F46800">
  <img src="https://img.shields.io/badge/Security-Hardening-green">
</p>

<h1 align="center">🛰️ INDIGITAL Systems Infrastructure Engineer Lab</h1>

<p align="center">
A complete, production‑style Systems Infrastructure Engineering lab demonstrating automation, IaC, monitoring, security, and operational documentation.
</p>

---

## 📘 Table of Contents
- [🚀 Quickstart](#-quickstart)
- [📁 Repository Structure](#-repository-structure)
- [🛠️ Ansible Automation](#️-ansible-automation)
- [🧱 Proxmox IaC (Terraform)](#-proxmox-iac-terraform)
- [📊 Monitoring (Prometheus + Grafana)](#-monitoring-prometheus--grafana)
- [🔐 Security](#-security)
- [📚 Documentation](#-documentation)
- [🎯 Purpose](#-purpose)
- [📌 Status](#-status)

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

Import the dashboard:
Code

monitoring/grafana/dashboards/linux-systems.json

📁 Repository Structure
Code

.
├── ansible/
├── proxmox/
├── monitoring/
├── security/
└── docs/

🧩 Architecture Overview
mermaid

flowchart TD

    subgraph ProxmoxCluster[Proxmox Cluster]
        PVE1(Proxmox Node 1)
        PVE2(Proxmox Node 2)
    end

    subgraph Terraform[Terraform IaC]
        TF[Terraform Configs]
    end

    subgraph Ansible[Ansible Automation]
        PB1[baseline.yml]
        PB2[webserver.yml]
        PB3[database.yml]
    end

    subgraph Monitoring[Monitoring Stack]
        PROM[Prometheus]
        GRAF[Grafana]
    end

    TF --> PVE1
    TF --> PVE2

    PVE1 --> VM1[Linux VM 1]
    PVE2 --> VM2[Linux VM 2]

    Ansible --> VM1
    Ansible --> VM2

    VM1 --> PROM
    VM2 --> PROM

    PROM --> GRAF

🛠️ Ansible Automation

Includes:

    Linux baseline configuration

    NGINX deployment

    MySQL provisioning

    Group variables

    Inventories for dev/prod

    Templates and handlers

These playbooks simulate real configuration management workflows used in production.
🧱 Proxmox IaC (Terraform)

The proxmox/terraform directory includes:

    VM provisioning using cloud-init templates

    Parameterized variables for CPU, memory, storage, and networking

    Output definitions for VM names and IDs

    Migration notes for VMware → Proxmox transitions

This demonstrates infrastructure-as-code practices for virtualization platforms.
📊 Monitoring (Prometheus + Grafana)

Includes:

    Prometheus configuration

    Alert rules (CPU, disk, service health)

    Grafana dashboards for Linux systems

    Node exporter integration

This reflects real observability workflows for mission-critical systems.
🔐 Security

Includes:

    CIS-aligned Linux hardening checklist

    Vulnerability scan summary (OpenVAS)

    Certificate renewal automation script

    Secure operational practices

This demonstrates awareness of compliance, risk management, and secure operations.
📚 Documentation

The docs/ directory contains:

    Architecture diagram

    Linux maintenance runbook

    Incident response example

    Change management example

These documents show communication clarity and operational discipline.
🎯 Purpose

This lab demonstrates readiness for a Systems Infrastructure Engineer role by showcasing:

    Technical depth

    Automation-first mindset

    Operational maturity

    Security awareness

    Clear communication

    Real-world engineering workflows

📌 Status

Actively maintained and expanded.