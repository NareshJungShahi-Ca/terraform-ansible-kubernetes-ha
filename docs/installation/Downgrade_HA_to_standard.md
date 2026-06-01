# Standard Kubernetes Cluster Installation

## Overview

This guide explains how to deploy a standard Kubernetes cluster using:

- Terraform
- Ansible
- kubeadm
- containerd
- Calico CNI
- MetalLB
- NGINX Gateway Fabric
- Prometheus

The deployment provisions infrastructure with Terraform and configures Kubernetes automatically using Ansible.

---

# Architecture

![Standard Cluster Architecture](../../images/standard-cluster.png)
 
---

# Prerequisites

| Requirement | Recommended |
|---|---|
| OS | macOS or Linux |
| RAM | 16GB+ |
| CPU | 6+ Cores |
| Virtualization | Enabled |

---

## Required Tools

| Tool | Version |
|---|---|
| Terraform | >= 1.5 |
| Ansible | >= 2.16 |
| Python | >= 3.11 |
| Multipass | Latest |


---

# Current Cluster 

```bash
multipass list
```

Example:

```text
Name            State    IPv4             Image
k8s-lb-0        Running  192.168.2.8     Ubuntu 22.04 LTS
k8s-lb-1        Running  192.168.2.9     Ubuntu 22.04 LTS
k8s-master-0    Running  192.168.2.10    Ubuntu 22.04 LTS
k8s-master-1    Running  192.168.2.11    Ubuntu 22.04 LTS
k8s-master-2    Running  192.168.2.12    Ubuntu 22.04 LTS
k8s-worker-0    Running  192.168.2.13    Ubuntu 22.04 LTS


```bash
multipass shell k8s-master-0
kubectl get nodes
```

Example:

```text
NAME            STATUS   ROLES           AGE   VERSION
k8s-master-0    Ready    control-plane   5m    v1.36.x
k8s-master-1    Ready    control-plane   5m    v1.36.x
k8s-master-2    Ready    control-plane   5m    v1.36.x
k8s-worker-0    Ready    <none>          4m    v1.36.x
```

---


# Reduce  Virtual Machines


```bash
cd terraform
```

Edit Terraform variables:

```bash
terraform apply -parallelism=1
```

Example:

```hcl
lb_cpu = 0
lb_disk = 0G
lb_memory = 0G
lb_node_count = 0

master_cpu    = 2
master_disk = 20G
master_memory = 2G
master_node_count = 1

worker_cpu = 1
worker_disk = 20G
worker_memory = 1G
worker_node_count = 2
```
---

Expected output:

- Multipass virtual machines
- Assigned internal IP addresses


# Verify Infrastructure

Check VM status:

```bash
multipass list
```

Example:

```text
Name            State    IPv4             Image
k8s-master-0    Running  192.168.2.10    Ubuntu 22.04 LTS
k8s-worker-0    Running  192.168.2.11    Ubuntu 22.04 LTS
k8s-worker-1    Running  192.168.2.12    Ubuntu 22.04 LTS
```

### Move into Ansible directory:

```bash
cd ../ansible/standard_cluster
```

### Run deployment playbook:

```bash
ansible-playbook site.yaml
```

This step performs:

- Swap memory disable
- Enable IPv4 packet forwarding and bridge
- containerd installation
- Kubernetes package installation
- kubeadm cluster initialization
- worker node joining
- Calico CNI deployment
- MetalLB installation
- Gateway Api CRDs
- NGINX Gateway Fabric installation
- cert-manager
- Prometheus

# Validate Cluster

Verify node status:

```bash
multipass shell k8s-master-0
kubectl get nodes
```

Expected:

```text
NAME            STATUS   ROLES           AGE   VERSION
k8s-master-0    Ready    control-plane   5m    v1.36.x
k8s-worker-0    Ready    <none>          4m    v1.36.x
k8s-worker-1    Ready    <none>          4m    v1.36.x
```
