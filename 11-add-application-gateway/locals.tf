locals {
  resource_group_name = "${var.prefix}-${var.resource_group_name}"
  key_vault_name      = var.key_vault_name != "" ? "${var.prefix}-${var.key_vault_name}-kv" : "${var.prefix}-${substr(sha512(local.resource_group_name), 0, 10)}-kv"
  vm_name             = "${substr(join("-", [var.prefix, var.vm_name]), 0, 12)}-vm"
  sql_server_name     = "${var.prefix}-${var.sql_server_name}-sqlsrv"
  sql_database_name   = "${var.prefix}-${var.sql_database_name}-sqldb"
}
