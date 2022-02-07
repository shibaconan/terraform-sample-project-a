#--------------------------------------------------------------------------------
# Common Variables
#--------------------------------------------------------------------------------
variable "service" {}
variable "env" {}

#--------------------------------------------------------------------------------
# EC2 Variables
#--------------------------------------------------------------------------------
variable "ec2_name" {}
variable "ec2_ami" {}
variable "ec2_instance_type" {}
variable "ec2_key_name" {}
variable "ec2_security_group_ids" {type = list(string)}
variable "ec2_private_ip" {}
variable "ec2_subnet_id" {}
variable "ec2_iam_instance_profile" {}
variable "ec2_ebs_optimized" {}
variable "ec2_volume_type" {}
variable "ec2_volume_size" {}
variable "ec2_encrypted" {}
variable "ec2_additional_tags" {
  type    = map(string)
  default = {}
}
