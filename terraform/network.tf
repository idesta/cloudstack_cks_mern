# 1. Look up your existing static Public IP
data "cloudstack_ipaddress" "k8s_public_ip" {
  filter {
    name  = "ipaddress"
    value = "196.188.250.157"
  }
}

# 2. Manual Firewall Rules
# Only defining what CloudStack DOES NOT manage automatically.
resource "cloudstack_firewall" "k8s_fw" {
  ip_address_id = data.cloudstack_ipaddress.k8s_public_ip.id
  managed       = true

  # Access to your MERN Frontend/LoadBalancer (Port 80)
  rule {
    cidr_list = ["0.0.0.0/0"]
    protocol  = "tcp"
    ports     = ["80"]
  }

  # Access to your Node.js API directly (Optional - Port 5000)
  # rule {
  #   cidr_list = ["0.0.0.0/0"]
  #   protocol  = "tcp"
  #   ports     = ["5000"]
  # }
}