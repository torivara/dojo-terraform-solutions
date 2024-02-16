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
