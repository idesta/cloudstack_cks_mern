# --- CloudStack Provider Variables ---
variable "cloudstack_api_url" { 
  description = "The CloudStack API endpoint" 
  }
variable "cloudstack_api_key" { 
  description = "CloudStack API Key" 
  sensitive = true
   }
variable "cloudstack_secret_key" { 
  description = "CloudStack Secret Key" 
  sensitive = true 
  }

# --- Infrastructure Variables ---
variable "cs_zone" {
  description = "CloudStack Zone name or ID"
  default     = "zcs-et-aa01"
}

variable "cs_network_id" {
  description = "The UUID of the network where cluster will be deployed"
}

# NEW: Declare the missing variable for firewall rules
variable "allowed_ssh_ip" {
  description = "CIDR block allowed to access the cluster via SSH/API"
  default     = "0.0.0.0/0"
}

# --- CKS Specific Variables ---
variable "k8s_version_id" {
  description = "The UUID of the Kubernetes version (e.g., v1.31.1-calico)"
}

variable "cluster_offering" {
  description = "Service offering for the nodes (2C4G is recommended for MERN)"
  default     = "2C4G"
}

variable "worker_count" {
  description = "Number of worker nodes"
  default     = 1
}

variable "disk_size" {
  description = "Root disk size in GB"
  default     = 10
}

# --- Access Control ---
variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "cloudstack_keypair"
}