resource "aws_backup_plan" "backup-plan-config" {
  name = var.backup_plan_name

  rule {
    rule_name           = var.backup_rule_name
    target_vault_name   = aws_backup_vault.backup-vault-config.name
    schedule            = var.backup_rule_schedule
    start_window        = var.backup_rule_start_window
    completion_window   = var.backup_rule_completion_window
    recovery_point_tags = {}
    
    lifecycle {
      cold_storage_after = var.backup_rule_cold_storage_after
      delete_after       = var.backup_rule_delete_after
    }
  }
}

resource "aws_backup_vault" "backup-vault-config" {
  name = var.backup_vault_name
}

resource "aws_backup_selection" "backup-selection-config" {
  name         = var.backup_selection_name
  iam_role_arn = var.backup_selection_iam_role_arn
  plan_id      = aws_backup_plan.backup-plan-config.id

  selection_tag {
    type  = var.backup_selection_tag_type
    key   = var.backup_selection_tag_key
    value = var.backup_selection_tag_value
  }
}
