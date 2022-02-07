#--------------------------------------------------------------------------------
# VPC Variables
#--------------------------------------------------------------------------------
#----- VPC -----#
variable "vpc_cidr_block" {}
variable "vpc_instance_tenancy" {}
variable "vpc_enable_dns_support" {}
variable "vpc_enable_dns_hostnames" {}
variable "vpc_name" {}
variable "vpc_additional_tags" {
  type    = map(string)
  default = {}
}

#----- VPC Internet Gateway -----#
variable "vpc_ig_name" {}

#----- VPC NAT Gateway -----#
variable "vpc_ngw_enabled" {
  type        = bool
  default     = true
}
variable "vpc_ngw_eip" {
  default = null
}
variable "vpc_ngw_name" {
  default = null
}

#----- VPC Subnet -----#
variable "az_a" {}
variable "az_c" {}

variable "vpc_sub_pub_a_cidr_block" {}
variable "vpc_sub_pub_a_name" {}

variable "vpc_sub_pri_a_cidr_block" {}
variable "vpc_sub_pri_a_name" {}

variable "vpc_sub_pub_c_cidr_block" {}
variable "vpc_sub_pub_c_name" {}

variable "vpc_sub_pri_c_cidr_block" {}
variable "vpc_sub_pri_c_name" {}

variable "vpc_public_subnet_tags" {
  type    = map(string)
  default = {}
}

variable "vpc_private_subnet_tags" {
  type    = map(string)
  default = {}
}

#----- VPC Route Table ---#
variable "vpc_rt_pub_name" {}
variable "vpc_rt_pri_name" {}

variable "vpc_rt_pub_routes" {
  type    = list(map(string))
  default = []
}

variable "vpc_rt_pri_routes" {
  type    = list(map(string))
  default = []
}
