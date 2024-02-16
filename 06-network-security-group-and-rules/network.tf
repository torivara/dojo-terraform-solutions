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
