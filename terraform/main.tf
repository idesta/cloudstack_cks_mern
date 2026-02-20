resource "cloudstack_kubernetes_cluster" "mern_k8s" {
  name               = "mern-k8s-cluster"
  zone               = var.cs_zone
  kubernetes_version = var.k8s_version_id 
  service_offering   = var.cluster_offering
  network_id         = var.cs_network_id
  keypair            = var.key_name
  size               = var.worker_count

  # Force non-HA to reduce the number of network rules CloudStack needs to create
  #noderootdisksize   = 20 # Ensure enough disk for the master
  #ip_address_id    = data.cloudstack_ipaddress.k8s_public_ip.id
}