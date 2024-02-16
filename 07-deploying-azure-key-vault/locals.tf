locals {
  resource_group_name = "${var.prefix}-${var.resource_group_name}"
  key_vault_name      = var.key_vault_name != "" ? "${var.prefix}-${var.key_vault_name}-kv" : "${var.prefix}-dojokeyvault-${substr(sha512(local.resource_group_name), 0, 10)}-kv"
}
