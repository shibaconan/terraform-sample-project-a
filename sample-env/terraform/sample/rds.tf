variable "db_username" {}
variable "db_password" {}

module "rds" {
  source = "../../../modules/rds"
  service = "sample"
  env     = "test"

  #----- RDS -----#
  db_identifier                 = "sample-rds01"
  db_engine                     = "mysql"
  db_engine_version             = "8.0.23"
  db_instance_class             = "db.t3.medium"
  db_allocated_storage          = "100"
  db_storage_type               = "gp2"
  db_name                       = "sample-rds"
  db_username                   = var.db_username # get from TF_VAR_db_username
  db_password                   = var.db_password # get from TF_VAR_db_password
  db_multi_az                   = "true"
  db_vpc_security_group_ids     = [aws_security_group.sg-rds-config.id]
  db_backup_retention_period    = "2"
  db_backup_window              = "17:00-17:30"
  db_apply_immediately          = "false"
  db_auto_minor_version_upgrade = "false"
  db_skip_final_snapshot        = "false"
  db_deletion_protection        = "true"
  db_storage_encrypted          = "true"

  #----- RDS Subnet Group -----#
  db_sg_name       = "sample-subnet-group"
  db_sg_subnet_ids = [
    data.terraform_remote_state.common.outputs.vpc_sub_pri_a_id,
    data.terraform_remote_state.common.outputs.vpc_sub_pri_c_id
  ]

  #----- RDS Parameter Group -----#
  db_pg_name   = "sample-rds-pg"
  db_pg_family = "mysql8.0"
  db_pg_parameters = [
    {
      name  = "character_set_client",
      value = "utf8mb4"
    },
    {
      name  = "character_set_server",
      value = "utf8mb4"
    },
    {
      name  = "innodb_file_per_table",
      value = "1"
    }
  ]
}
