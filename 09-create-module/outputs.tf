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
  value = azurerm_virtual_network.vnet.subnet[*]
}

output "nsg_id" {
  value = module.nsg.nsg_id
}

output "nsg_rules" {
  value = module.nsg.nsg_rules
}
