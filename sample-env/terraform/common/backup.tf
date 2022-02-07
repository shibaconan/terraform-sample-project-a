module "backup" {
  source = "../../../modules/backup"

  #----- Backup Plan -----#
  backup_plan_name               = "sample_backup_plan"
  backup_rule_name               = "sample_backup_rule"
  backup_rule_schedule           = "cron(0 19 * * ? *)"
  backup_rule_start_window       = 60
  backup_rule_completion_window  = 120
  backup_rule_cold_storage_after = 0
  backup_rule_delete_after       = 7

  #----- Backup Vault -----#
  backup_vault_name = "sample_ec2"

  #----- Backup Slection -----#
  backup_selection_name         = "sample_ec2_backup"
  backup_selection_iam_role_arn = "${aws_iam_role.sample-backup-role.arn}"
  backup_selection_tag_type     = "STRINGEQUALS"
  backup_selection_tag_key      = "AWSBackup"
  backup_selection_tag_value    = "True"
}
