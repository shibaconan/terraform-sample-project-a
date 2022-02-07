#----- RDS Instance -----$
output "rds_id" {
  value = aws_db_instance.rds-config.id
}

output "rds_address" {
  value = aws_db_instance.rds-config.address
}

output "rds_identifier" {
  value = aws_db_instance.rds-config.identifier
}

output "rds_db_name" {
  value = aws_db_instance.rds-config.name
}

output "rds_db_port" {
  value = aws_db_instance.rds-config.port
}

#----- RDS Subnet Group -----#
output "rds_db_subnet_group" {
  value = aws_db_subnet_group.rds-sg-config.id
}

#----- RDS Parameter Group -----#
output "rds_db_parameter_group" {
  value = aws_db_parameter_group.rds-pg-config.id
}
