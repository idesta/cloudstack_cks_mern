# --- CloudStack Connection ---
cloudstack_api_url    = "https://cloudstack.zergaw.com/client/api"
cloudstack_api_key    = "-WwhxpqTbWiL-CoHpcl7PV4tXqmlbtmcAuqIJ-gfVXz6sN7ZrbxH6d-fC85_qAEwL_TiGckjuHwyTUMZbfVI3Q"
cloudstack_secret_key = "ChRTXTFP2ZXdTy0TJhbRDH6a5V1fCY9qkJ6B0YCoSifm2Ztp6pEWOGL3aVRmZDM5ZjAAO1NRy2Sjf3czajXYxw"

# --- Infrastructure ---
cs_zone       = "zcs-et-aa01"
cs_network_id = "5366de98-c84b-452e-a775-ba2665fe2294"
key_name      = "cloudstack_keypair"
allowed_ssh_ip = "0.0.0.0/0"

# --- Managed Kubernetes (CKS) Specifics ---
# Using v1.33.1-calico from your cmk list
k8s_version_id   = "254eb015-8bac-41e1-a979-c8b413ea4845" 

# Node sizing & Cluster configuration
cluster_offering = "2C4G" 
worker_count     = 1
disk_size        = 10