# Create RDS Instance
resource "aws_db_instance" "rds-config" {
  identifier                 = var.db_identifier
  engine                     = var.db_engine
  engine_version             = var.db_engine_version
  instance_class             = var.db_instance_class
  allocated_storage          = var.db_allocated_storage
  storage_type               = var.db_storage_type
  name                       = var.db_name
  username                   = var.db_username
  password                   = var.db_password
  multi_az                   = var.db_multi_az

  db_subnet_group_name       = aws_db_subnet_group.rds-sg-config.id
  parameter_group_name       = aws_db_parameter_group.rds-pg-config.id
  vpc_security_group_ids     = var.db_vpc_security_group_ids
  backup_retention_period    = var.db_backup_retention_period
  backup_window              = var.db_backup_window
  auto_minor_version_upgrade = var.db_auto_minor_version_upgrade
  apply_immediately          = var.db_apply_immediately
  skip_final_snapshot        = var.db_skip_final_snapshot
  deletion_protection        = var.db_deletion_protection
  storage_encrypted          = var.db_storage_encrypted

  tags = merge(
    var.db_additional_tags,
    {
      Service = var.service
      Env     = var.env
    }
  )
}

# Create RDS Subnet Group
resource "aws_db_subnet_group" "rds-sg-config" {
  name       = var.db_sg_name
  subnet_ids = var.db_sg_subnet_ids

  tags = {
    Name    = var.db_sg_name
    Service = var.service
    Env     = var.env
  }
}

# Create RDS Parameter Group
resource "aws_db_parameter_group" "rds-pg-config" {
  name   = var.db_pg_name
  family = var.db_pg_family

  dynamic "parameter" {
    for_each = var.db_pg_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}
