output "database_address" {
  description = "Address for RDS database"
  value       = module.rds.rds_address
}

output "database_security_group" {
  description = "RDS database security group ID"
  value = aws_security_group.sg-rds-config.id
}
