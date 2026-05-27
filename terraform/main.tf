terraform {
    required_providers {
        multipass = {
            source = "todoroff/multipass"
        }
    }
}

provider "multipass" {}

resource "multipass_instance" "k8s_lb_nodes" {
     count = var.lb_node_count
     name = "k8s-lb-${count.index}"
     cpus = var.lb_cpu
     memory = var.lb_memory
     image = var.lb_image
     disk = var.lb_disk
     cloud_init = <<-EOT
        users:
         - name: ubuntu
           sudo: ALL=(ALL) NOPASSWD:ALL
           ssh_authorized_keys:
             - ${file("~/.ssh/id_rsa.pub")}

     EOT
}

resource "multipass_instance" "k8s_master_nodes" {
     count = var.master_node_count
     name = "k8s-master-${count.index}"
     cpus = var.master_cpu
     memory = var.master_memory
     image = var.master_image
     disk = var.master_disk
     cloud_init = <<-EOT
        users:
         - name: ubuntu
           sudo: ALL=(ALL) NOPASSWD:ALL
           ssh_authorized_keys:
              - ${file("~/.ssh/id_rsa.pub")}
        
     EOT
}

resource "multipass_instance" "k8s_worker_nodes" {
     count = var.worker_node_count
     name = "k8s-worker-${count.index}"
     cpus = var.worker_cpu
     memory = var.worker_memory
     image = var.worker_image
     disk = var.worker_disk
     cloud_init = <<-EOT
        users:
         - name: ubuntu
           sudo: ALL=(ALL) NOPASSWD:ALL
           ssh_authorized_keys:
              - ${file("~/.ssh/id_rsa.pub")}
              
     EOT
}

