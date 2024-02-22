module "nsg" {
  source      = "./nsg-module"
  nsg_name    = "${var.prefix}-${var.nsg_name}"
  nsg_rules   = var.nsg_security_rules
  nsg_rg_name = azurerm_resource_group.rg.name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each                  = var.subnets
  network_security_group_id = module.nsg.nsg_id
  subnet_id                 = "${azurerm_virtual_network.vnet.id}/subnets/${each.value.name}"
}
