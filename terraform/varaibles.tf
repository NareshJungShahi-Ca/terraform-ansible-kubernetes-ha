# LB Variables
variable "lb_node_count" {
    description = "Number of load balancer nodes"
    type = number
}

variable "lb_cpu" {
    description = "CPUs for loadbalancer nodes"
    type = number
}

variable "lb_memory" {
    description = "Memory for loadbalancer nodes(e.g. 1G,2G)"
    type = string
}

variable "lb_disk" {
    description = "Disk Storage for loadbalancer nodes(e.g. 5G,10G)"
    type = string
}
variable "lb_image" {
    description = "Image for loadbalancer nodes"
    type = string
    default = "jammy"
}

# Master Variables
variable "master_node_count" {
    description = "Number of master nodes"
    type = number
}

variable "master_cpu" {
    description = "CPUs for master nodes"
    type = number
}

variable "master_memory" {
    description = "Memory for master nodes(e.g. 1G,2G)"
    type = string
}

variable "master_disk" {
    description = "Disk Storage for master nodes(e.g. 5G,20G)"
    type = string
}
variable "master_image" {
    description = " Image for master nodes"
    type = string
    default = "jammy"
}

# Worker Variables
variable "worker_node_count" {
    description = "Number of worker nodes"
    type = number 
}

variable "worker_cpu" {
    description = "CPUs for worker nodes"
    type = number
}

variable "worker_memory" {
    description = "Memory for worker nodes(e.g. 1G,2G)"
    type = string
}

variable "worker_disk" {
    description = "Disk Storage for worker nodes(e.g. 5G,20G)"
    type = string
}
variable "worker_image" {
    description = " Image for worker nodes"
    type = string
    default = "jammy"
}
