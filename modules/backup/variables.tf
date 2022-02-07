#--------------------------------------------------------------------------------
# Backup Variables
#--------------------------------------------------------------------------------
#----- Backup Plan -----#
variable "backup_plan_name" {}
variable "backup_rule_name" {}
variable "backup_rule_schedule" {}
variable "backup_rule_start_window" {}
variable "backup_rule_completion_window" {}
variable "backup_rule_cold_storage_after" {}
variable "backup_rule_delete_after" {}

#----- Backup Vault -----#
variable "backup_vault_name" {}

#----- Backup Slection -----#
variable "backup_selection_name" {}
variable "backup_selection_iam_role_arn" {}
variable "backup_selection_tag_type" {}
variable "backup_selection_tag_key" {}
variable "backup_selection_tag_value" {}
