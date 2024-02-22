resource "azurerm_network_security_group" "nsg" {
  location            = azurerm_resource_group.rg.location
  name                = "${var.prefix}-${var.nsg_name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.nsg_security_rules
    content {
      access                                     = security_rule.value.access
      direction                                  = security_rule.value.direction
      name                                       = security_rule.value.name
      priority                                   = security_rule.value.priority
      protocol                                   = security_rule.value.protocol
      destination_address_prefix                 = security_rule.value.destination_address_prefix
      source_address_prefix                      = security_rule.value.source_address_prefix
      source_port_range                          = security_rule.value.source_port_range
      destination_port_range                     = security_rule.value.destination_port_range
      destination_address_prefixes               = null
      destination_application_security_group_ids = null
      destination_port_ranges                    = null
      source_address_prefixes                    = null
      source_application_security_group_ids      = null
      source_port_ranges                         = null
    }
  }
}

resource "azurerm_network_security_group" "nsg_rule_blocks" {
  location            = azurerm_resource_group.rg.location
  name                = "${var.prefix}-${var.nsg_name}-rule-blocks-nsg"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "nsg_rules" {
  for_each                                   = var.nsg_security_rules
  access                                     = each.value.access
  direction                                  = each.value.direction
  name                                       = each.value.name
  network_security_group_name                = azurerm_network_security_group.nsg_rule_blocks.name
  priority                                   = each.value.priority
  protocol                                   = each.value.protocol
  resource_group_name                        = azurerm_resource_group.rg.name
  destination_address_prefix                 = each.value.destination_address_prefix
  source_address_prefix                      = each.value.source_address_prefix
  source_port_range                          = each.value.source_port_range
  destination_port_range                     = each.value.destination_port_range
  destination_address_prefixes               = null
  destination_application_security_group_ids = null
  destination_port_ranges                    = null
  source_address_prefixes                    = null
  source_application_security_group_ids      = null
  source_port_ranges                         = null
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each                  = var.subnets
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = "${azurerm_virtual_network.vnet.id}/subnets/${each.value.name}"
  depends_on = [
    azurerm_virtual_network.vnet,
    azurerm_subnet.subnets
  ]
}
