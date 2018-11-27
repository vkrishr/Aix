#####################################################################
##
##      Created 8/21/18 by admin. for AIX71ITCS
##
#####################################################################

variable "openstack_user_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_password" {
  type = "string"
  description = "Generated"
}

variable "openstack_project_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_domain_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_region" {
  type = "string"
  description = "Generated"
}

variable "instance_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_image_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_flavor_name" {
  type = "string"
  description = "Generated"
}

variable "sudo_user" {
  description = "specify an username"
  default     = "clouduser"
}

variable "sudo_password_length" {
  description = "specify the password length"
  default     = "20"
}


