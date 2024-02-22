variable "resource_group_name" {
  type        = string
  description = "Resource group name. This will be prefixed."
  default     = "defaultname"
}

variable "prefix" {
  type        = string
  description = "Prefix for your resource group name."
  default     = "dojolab"
}

variable "location" {
  type        = string
  description = "Location for your resource group. Allowed locations: norwayeast, norwaywest, westeurope, northeurope"
  default     = "norwayeast"
  validation {
    condition     = contains(["norwayeast", "Norway East", "norwaywest", "Norway West", "westeurope", "West Europe", "northeurope", "North Europe"], var.location)
    error_message = "Location must be in the allowed list"
  }
}

variable "vnet_name" {
  type        = string
  description = "Name for your virtual network. This will be prefixed."
  default     = "defaultname"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for your virtual network. Defaults to 10.0.0.0/16."
  default     = ["10.0.0.0/16"]
}

variable "default_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for your default subnet. Defaults to 10.0.0.0/24."
  default     = ["10.0.0.0/24"]
}

variable "default_subnet_name" {
  type        = string
  description = "Default subnet name."
  default     = "default"
}

variable "additional_subnets" {
  type = map(object({ address_prefixes = list(string), name = string, resource_group_name = string, virtual_network_name = string }))
  default = {
    ApplicationGatewaySubnet = {
      address_prefixes     = ["10.0.1.0/24"]
      name                 = "ApplicationGatewaySubnet"
      resource_group_name  = "dojolab-defaultname"
      virtual_network_name = "dojolab-defaultname-vnet"
    }
  }
}

variable "nsg_name" {
  type        = string
  description = "Name of your network security group. This will be prefixed."
  default     = "dojonsg"
}

variable "nsg_security_rules" {
  type = map(object({ access = string, direction = string, name = string, priority = number, protocol = string, source_port_range = string, destination_port_range = string, source_address_prefix = string, destination_address_prefix = string }))
  default = {
    allow-ssh-inbound = {
      access                     = "Allow"
      direction                  = "Inbound"
      name                       = "AllowInboundSsh"
      priority                   = 100
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "VirtualNetwork"
    }
    allow-https-inbound = {
      access                     = "Allow"
      direction                  = "Inbound"
      name                       = "AllowInboundHttps"
      priority                   = 110
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "VirtualNetwork"
    }
    allow-rdp-inbound = {
      access                     = "Allow"
      direction                  = "Inbound"
      name                       = "AllowInboundRdp"
      priority                   = 120
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "VirtualNetwork"
    }
  }
}
