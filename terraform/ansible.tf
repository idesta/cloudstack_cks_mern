# 1. Ensure SSH Key Permissions are 0400 (Standard Security)
resource "null_resource" "fix_key_permissions" {
  provisioner "local-exec" {
    command = "chmod 0400 ${abspath("../cloudstack_keypair")}"
  }

  triggers = {
    key_exists = fileexists("../cloudstack_keypair")
  }
}

# 2. Generate the Ansible Inventory (Targeting the Managed Master IP)
resource "local_file" "ansible_inventory" {
  content = <<EOT
[masters]
master ansible_host=${cloudstack_kubernetes_cluster.mern_k8s.ip_address} ansible_port=2222 ansible_user=cloud ansible_ssh_private_key_file=${abspath("../cloudstack_keypair")}

[workers]
worker-0 ansible_host=${cloudstack_kubernetes_cluster.mern_k8s.ip_address} ansible_port=2223 ansible_user=cloud ansible_ssh_private_key_file=${abspath("../cloudstack_keypair")}

[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
EOT
  filename = "../ansible/inventory/hosts.ini"
}

# 3. Execute the Verification Playbook
resource "null_resource" "run_ansible" {
  depends_on = [
    cloudstack_kubernetes_cluster.mern_k8s,
    local_file.ansible_inventory,
    null_resource.fix_key_permissions
  ]

  provisioner "local-exec" {
    command = <<EOT
      # Wait longer for Managed K8s as CloudStack has to bootstrap the control plane
      echo "Waiting for CloudStack to bootstrap the managed cluster..."
      sleep 120; 

      # Run the verification playbook
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -i ../ansible/inventory/hosts.ini ../ansible/playbooks/verify.yml
    EOT
  }
}


# [ansible-playbook -i ../ansible/inventory/hosts.ini ../ansible/playbooks/verify.yml]


