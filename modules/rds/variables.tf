#--------------------------------------------------------------------------------
# Common Variables
#--------------------------------------------------------------------------------
variable "service" {}
variable "env" {}

#--------------------------------------------------------------------------------
# RDS Variables
#--------------------------------------------------------------------------------
#----- RDS -----#
variable "db_identifier" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_allocated_storage" {}
variable "db_storage_type" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_multi_az" {}
variable "db_vpc_security_group_ids" {type = list(string)}
variable "db_backup_retention_period" {}
variable "db_backup_window" {}
variable "db_apply_immediately" {}
variable "db_auto_minor_version_upgrade" {}
variable "db_skip_final_snapshot" {}
variable "db_deletion_protection" {}
variable "db_storage_encrypted" {}
variable "db_additional_tags" {
  type    = map(string)
  default = {}
}

#----- RDS Subnet Group -----#
variable "db_sg_name" {}
variable "db_sg_subnet_ids" {type = list(string)}

#----- RDS Parameter Group -----#
variable "db_pg_name" {}
variable "db_pg_family" {}
variable "db_pg_parameters" {
  type    = list(map(string))
  default = []
}
