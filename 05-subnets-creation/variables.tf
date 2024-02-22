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

variable "subnets" {
  type = map(object({ address_prefixes = list(string), name = string, resource_group_name = string, virtual_network_name = string }))
  default = {
    default = {
      address_prefixes     = ["10.0.0.0/24"]
      name                 = "default"
      resource_group_name  = "dojolab-defaultname"
      virtual_network_name = "dojolab-defaultname-vnet"
    },
    ApplicationGatewaySubnet = {
      address_prefixes     = ["10.0.1.0/24"]
      name                 = "ApplicationGatewaySubnet"
      resource_group_name  = "dojolab-defaultname"
      virtual_network_name = "dojolab-defaultname-vnet"
    }
  }
}
