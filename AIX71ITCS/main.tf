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
}

output "instanceip" {
  value = "${openstack_compute_instance_v2.instance.network.0.fixed_ip_v4}"
}

