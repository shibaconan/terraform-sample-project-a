# Create EC2 Instance
resource "aws_instance" "ec2-config" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_key_name
  vpc_security_group_ids = var.ec2_security_group_ids
  private_ip             = var.ec2_private_ip
  subnet_id              = var.ec2_subnet_id
  iam_instance_profile   = var.ec2_iam_instance_profile
  ebs_optimized          = var.ec2_ebs_optimized
  root_block_device {
    volume_type = var.ec2_volume_type
    volume_size = var.ec2_volume_size
    encrypted   = var.ec2_encrypted

  }

  tags = merge(
    var.ec2_additional_tags,
    {
      Name    = var.ec2_name
      Service = var.service
      Env     = var.env
    }
  )
}
