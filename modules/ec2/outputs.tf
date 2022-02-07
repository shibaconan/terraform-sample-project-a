output "ec2_id" {
  value = aws_instance.ec2-config.id
}

output "ec2_private_ip" {
  value = aws_instance.ec2-config.private_ip
}

output "ec2_subnet_id" {
  value = aws_instance.ec2-config.subnet_id
}
