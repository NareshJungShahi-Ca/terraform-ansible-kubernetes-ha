# terraform-ansible-kubernetes-ha

Production-style Kubernetes cluster automation using Terraform, Ansible, kubeadm, HAProxy, Keepalived, MetalLB, NGINX Gateway Fabric, and Prometheus.

This project supports:

- Standard Kubernetes Cluster deployment
- Highly Available (HA) Kubernetes Cluster deployment
- Standard → HA cluster upgrade
- HA → Standard cluster downgrade

Built for infrastructure automation, Kubernetes operations, DevOps learning, and production-style cluster lifecycle management.

---

# Architecture

## Kubernetes Clusters

![Cluster Architecture](/docs/images/Cluster_Architecture.png)


---

# Demo Screenshots

## Cluster Nodes

### Standard Kubernetes Cluster
![Cluster Nodes](docs/images/Standard_cluster.png)

### HA Kubernetes Cluster
![Cluster Nodes](docs/images/HA_cluster.png)

---

## HA Failover Testing

### Control Plane Failover
![HA Failover](docs/images/HA_Failover_test-1.png)
![HA Failover](docs/images/HA_Failover_test-2.png)
![HA Failover](docs/images/HA_Failover_test-3.png)

### Load Balancer Failover
![HA Failover](docs/images/HA_Failover_test-4.png)
![HA Failover](docs/images/HA_Failover_test-5.png)
![HA Failover](docs/images/HA_Failover_test-6.png)

---

## MetalLB External IP

![MetalLB](docs/images/MetalIB.png)

---

## Prometheus Monitoring

![Prometheus](docs/images/Prometheus-D-0.png)
![Prometheus](docs/images/Prometheus-D-1.png)
![Prometheus](docs/images/Prometheus-D-3.png)

---

# Demo Videos

- [Deploying Standard vs HA Kubernetes Clusters](https://youtu.be/5P0BwMrT-NQ)
- [Upgrading Standard Cluster to HA Cluster](https://youtu.be/aHgMB3grCxc)
- [HA Cluster Failure Testing](https://youtu.be/t41vQ-EFL1Y)

---

# Key Features

## Kubernetes Cluster Automation
- Automated Kubernetes installation using kubeadm
- Standard and Highly Available cluster topologies
- Automated control plane and worker node joining
- Containerd runtime configuration
- Calico CNI networking

## Infrastructure as Code
- Terraform-based VM provisioning
- Multipass virtualization
- Dynamic inventory generation

## High Availability
- HAProxy API load balancing
- Keepalived Virtual IP (VIP) failover
- Multi-control-plane Kubernetes architecture
- Control plane fault tolerance

## Cluster Lifecycle Management
- Deploy standard Kubernetes clusters
- Deploy HA Kubernetes clusters
- Upgrade standard clusters to HA
- Downgrade HA clusters to standard topology
- Dynamic infrastructure reconfiguration

## Networking & Gateway
- MetalLB LoadBalancer integration
- Gateway API CRDs
- NGINX Gateway Fabric
- External service exposure

## Observability & Monitoring
- Prometheus monitoring stack
- Kubernetes metrics collection
- Node and cluster monitoring
- Resource usage visibility

## DevOps Practices
- Modular Ansible roles
- Idempotent automation
- Reusable playbooks
- Infrastructure reproducibility
  
---

# Documentation

Detailed setup and operational guides:

- [Standard Cluster Installation](docs/installation/standard_cluster.md)
- [HA Cluster Installation](docs/installation/HA_cluster.md)
- [Upgrade Standard Cluster to HA](docs/installation/Upgrade_standard_to_ha.md)
- [Downgrade HA Cluster to Standard](docs/installation/Downgrade_HA_to_standard.md)


---

# Tech Stack

| Category | Technology |
|---|---|
| Infrastructure Provisioning | Terraform |
| Configuration Management | Ansible |
| Kubernetes Bootstrap | kubeadm |
| Container Runtime | containerd |
| Virtualization | Multipass |
| Networking | Calico |
| HA Load Balancing | HAProxy |
| VIP Failover | Keepalived |
| LoadBalancer | MetalLB |
| Gateway | NGINX Gateway Fabric |
| Monitoring | Prometheus |
  
---
# Future Improvements

- Grafana dashboard integration
- Alertmanager integration
- ArgoCD GitOps deployment
- cert-manager TLS automation
- External DNS support
- CSI storage integration
- CI/CD pipeline integration
- Automated cluster scaling and node management
- Multi-cluster environment support
- Proxmox-based Kubernetes infrastructure provisioning using Type-1 hypervisor architecture
- Extend the cluster into a unified AI/ML platform supporting:
  - distributed model training
  - data engineering pipelines
  - experiment tracking
  - scalable inference workloads
  - collaborative MLOps workflows
 
---

# Author

## Naresh Jung Shahi

Researcher | Machine Learning Engineer | Kubernetes & DevOps Enthusiast |  

- LinkedIn: https://www.linkedin.com/in/naresh-jung-shahi-0b2543223/

---

# License

MIT License
