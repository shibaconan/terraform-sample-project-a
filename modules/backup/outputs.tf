output "backup_plan_id" {
  value = aws_backup_plan.backup-plan-config.id
}

output "backup_vault_id" {
  value = aws_backup_vault.backup-vault-config.id
}

output "backup_selection_id" {
  value = aws_backup_selection.backup-selection-config.id
}
