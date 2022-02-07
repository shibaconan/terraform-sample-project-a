# Create EC2 Instance
module "ec2-prod-web" {
  source = "../../../modules/ec2"

  service = "sample"
  env     = "test"

  ec2_name               = "sample-web01"
  ec2_ami                = "ami-03d79d440297083e3"
  ec2_instance_type      = "t3.medium"
  ec2_key_name           = "sample"
  ec2_security_group_ids = [
    data.terraform_remote_state.common.outputs.sg_work_id,
    aws_security_group.sg-web-config.id
  ]
  ec2_private_ip         = "10.10.1.11"
  ec2_subnet_id          = data.terraform_remote_state.common.outputs.vpc_sub_pri_a_id
  ec2_ebs_optimized      = false
  ec2_volume_type        = "gp2"
  ec2_volume_size        = "50"
  ec2_encrypted          = true
  ec2_additional_tags = {
    "SSM"       = "enable"
    "AWSBackup" = "True"
  }
  ec2_iam_instance_profile = data.terraform_remote_state.common.outputs.iam_ec2_role_instance_profile
}

resource "aws_ami_from_instance" "web_YYYYMMDD" {
  name               = "sample-web-YYYYMMDD"
  source_instance_id = module.ec2-prod-web.ec2_id
}

# Create EC2 Instance
module "ec2-prod-web02" {
  source = "../../../modules/ec2"

  service = "sample"
  env     = "test"

  ec2_name               = "sample-web02"
  ec2_ami                = aws_ami_from_instance.web_YYYYMMDD.id
  ec2_instance_type      = "t3.medium"
  ec2_key_name           = "sample"
  ec2_security_group_ids = [
    data.terraform_remote_state.common.outputs.sg_work_id,
    aws_security_group.sg-web-config.id
  ]
  ec2_private_ip         = "10.10.3.11"
  ec2_subnet_id          = data.terraform_remote_state.common.outputs.vpc_sub_pri_c_id
  ec2_ebs_optimized      = false
  ec2_volume_type        = "gp2"
  ec2_volume_size        = "50"
  ec2_encrypted          = true
  ec2_additional_tags = {
    "SSM"       = "enable"
    "AWSBackup" = "True"
  }
  ec2_iam_instance_profile = data.terraform_remote_state.common.outputs.iam_ec2_role_instance_profile
}
