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
