output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "nsg_rules" {
  value = azurerm_network_security_rule.nsg_rules[*]
}
