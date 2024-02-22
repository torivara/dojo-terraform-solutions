output "resource_group_name" {
  value = local.resource_group_name
}

output "location" {
  value = var.location
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_rg_name" {
  value = azurerm_virtual_network.vnet.resource_group_name
}

output "subnets" {
  value = { for value in azurerm_virtual_network.vnet.subnet[*] : value.name => value }
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "nsg_rules" {
  value = azurerm_network_security_rule.nsg_rules[*]
}
