variable "nsg_name" {
  type        = string
  description = "Name of your NSG."
}

variable "nsg_rules" {
  type = map(object({
    access                     = string,
    direction                  = string,
    name                       = string,
    priority                   = number,
    protocol                   = string,
    source_port_range          = string,
    destination_port_range     = string,
    source_address_prefix      = string,
    destination_address_prefix = string
  }))
}

variable "nsg_rg_name" {
  type        = string
  description = "Resource group name for NSG."
}
