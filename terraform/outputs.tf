# 1. The Virtual IP (VIP) of the Kubernetes Master
output "cluster_master_ip" {
  description = "The IP address of the Kubernetes Master (Internal)"
  value       = cloudstack_kubernetes_cluster.mern_k8s.ip_address
}

# 2. Cluster Metadata
output "cluster_id" {
  description = "The UUID of the created Kubernetes Cluster"
  value       = cloudstack_kubernetes_cluster.mern_k8s.id
}

# 3. Connection Instructions
output "next_steps" {
  value = <<EOT
Your Managed Kubernetes cluster is being provisioned.
1. Once "Running", download the Kubeconfig via the CloudStack GUI.
2. Verify nodes with: kubectl get nodes
3. Use the Master IP ${cloudstack_kubernetes_cluster.mern_k8s.ip_address} in your Ansible inventory.
EOT
}