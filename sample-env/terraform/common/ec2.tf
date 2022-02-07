# Create EC2 Instance
module "ec2-ope" {
  source = "../../../modules/ec2"

  service = "sample"
  env     = "test"

  ec2_name               = "sample-ec2"
  ec2_ami                = "ami-03d79d440297083e3"
  ec2_instance_type      = "t3.micro"
  ec2_key_name           = "sample-key"
  ec2_security_group_ids = [
    aws_security_group.sg-work-config.id,
    aws_security_group.sg-ope-config.id
  ]
  ec2_private_ip         = "10.10.0.11"
  ec2_subnet_id          = module.vpc.vpc_sub_pub_a_id
  ec2_ebs_optimized      = false
  ec2_volume_type        = "gp2"
  ec2_volume_size        = "8"
  ec2_encrypted          = true
  ec2_additional_tags = {
    "SSM"       = "enable"
    "AWSBackup" = "True"
  }
  ec2_iam_instance_profile = "${aws_iam_instance_profile.sample-ec2-role-instance-profile.name}"
}
