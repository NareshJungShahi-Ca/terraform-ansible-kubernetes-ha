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







