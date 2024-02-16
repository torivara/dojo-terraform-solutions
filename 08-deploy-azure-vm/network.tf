resource "azurerm_virtual_network" "vnet" {
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  name                = "${var.prefix}-${var.vnet_name}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
  address_prefixes     = var.default_subnet_prefix
  name                 = var.default_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "additional_subnets" {
  for_each             = var.additional_subnets
  address_prefixes     = each.value.address_prefixes
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_network_security_group" "nsg" {
  location            = azurerm_resource_group.rg.location
  name                = "${var.prefix}-${var.nsg_name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "nsg_rules" {
  for_each                    = var.nsg_security_rules
  access                      = each.value.access
  direction                   = each.value.direction
  name                        = each.value.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  resource_group_name         = azurerm_resource_group.rg.name
  destination_address_prefix  = each.value.destination_address_prefix
  source_address_prefix       = each.value.source_address_prefix
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each                  = toset(azurerm_virtual_network.vnet.subnet[*])
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = each.value.id
}
