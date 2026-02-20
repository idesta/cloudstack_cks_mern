terraform {
  # CLI version lock
  required_version = ">= 1.5.0"

  required_providers {
    cloudstack = {
      source  = "cloudstack/cloudstack"
      # Using 0.6.0 is correct for 2026, as it fully supports 
      # the cloudstack_kubernetes_cluster resource.
      version = "0.6.0" 
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# Configure the CloudStack Provider
provider "cloudstack" {
  api_url    = var.cloudstack_api_url
  api_key    = var.cloudstack_api_key
  secret_key = var.cloudstack_secret_key
  
  # Optional: If your CloudStack uses a self-signed SSL certificate
  # verify_ssl = false 
}