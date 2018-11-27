#####################################################################
##
##      Created 8/21/18 by admin. for AIX71ITCS
##
#####################################################################

## REFERENCE {"openstack_network":{"type": "openstack_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "openstack" {
  user_name   = "${var.openstack_user_name}"
  password    = "${var.openstack_password}"
  tenant_name = "${var.openstack_project_name}"
  domain_name = "${var.openstack_domain_name}"
  auth_url    = "https://9.193.198.40:5000/v3"
  
  region      = "${var.openstack_region}"
  insecure    = true
  version = "~> 1.2"
}


resource "openstack_compute_instance_v2" "instance" {
  name      = "${var.instance_name}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  network {
  uuid = "de0b6515-188d-4309-96c3-37947b837520"
  }

resource "random_string" "password" {
  length = "${var.sudo_password_length}"
  special = true
  upper = true
  lower = true
  number = true
  override_special = "@#$&!"
  }
  
provisioner "remote-exec" {
   inline = [
     "sudo mkuser ${var.sudo_user} ; echo '${var.sudo_user}:${random_string.password.id}' | /bin/chpasswd -c",
     
   ]
  connection {
    type     = "ssh"
    user     = "dstadmin"
    password = "Greatday7@"
  }
 }
 
  provisioner "chef" {
   environment     = "_default"
   run_list        = ["role[dial]"]
   node_name       = "${var.instance_name}"
   server_url      = "https://9.109.122.210/organizations/deployment"
   recreate_client = true
   user_name       = "venkatraj"
   user_key        = "${file("/home/terraform/key/venkatraj.pem")}"
   version         = "12.14"
   # If you have a self signed cert on your chef server change this to :verify_none
   ssl_verify_mode = ":verify_none"
 
 }
 connection {
   type = "ssh"
   user = "root"
   password = "Work42ls"
   
 }
 }
 
 output "instanceip" {
  value = "${openstack_compute_instance_v2.instance.network.0.fixed_ip_v4}"
}


