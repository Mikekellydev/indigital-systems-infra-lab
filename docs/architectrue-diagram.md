# Systems Infrastructure Lab – Architecture Diagram

This diagram represents the lab environment used to demonstrate automation, virtualization, monitoring, and security workflows.

```mermaid
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
