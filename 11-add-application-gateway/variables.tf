variable "resource_group_name" {
  type        = string
  description = "Resource group name. This will be prefixed and affixed."
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
  description = "Name for your virtual network. This will be prefixed and affixed."
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
    },
    KeyVaultSubnet = {
      address_prefixes     = ["10.0.2.0/24"]
      name                 = "KeyVaultSubnet"
      resource_group_name  = "dojolab-defaultname"
      virtual_network_name = "dojolab-defaultname-vnet"
    },
    ServerSubnet = {
      address_prefixes     = ["10.0.3.0/24"]
      name                 = "ServerSubnet"
      resource_group_name  = "dojolab-defaultname"
      virtual_network_name = "dojolab-defaultname-vnet"
    }
  }
}

variable "nsg_name" {
  type        = string
  description = "Name of your network security group. This will be prefixed and affixed."
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

variable "key_vault_name" {
  type        = string
  description = "Name of your Key Vault. This will be prefixed and affixed."
  default     = ""
}

variable "vm_name" {
  type        = string
  description = "Name of your virtual machine. This will be prefixed and shortened if needed (15 chars max including prefix and affix)."
  default     = "dojovm"
}

variable "sql_server_name" {
  type        = string
  description = "Name of your SQL server. This will be prefixed and affixed."
  default     = "dojosqlsrv"
}

variable "sql_database_name" {
  type        = string
  description = "Name of your SQL database. This will be prefixed and affixed."
  default     = "dojosqldb"
}

variable "sql_login_username" {
  type        = string
  description = "Username of your SQL AzureAD administrator. Must be a full UPN."
  default     = "dojosqladmin@2SGo2Cloud.onmicrosoft.com"
}

variable "sql_login_object_id" {
  type        = string
  description = "Object ID of your AzureAD administrator. It is the object id found in Azure AD on the user object."
  default     = "861b634d-94e1-4018-8190-6f863d781425"
}

variable "appgateway_name" {
  type        = string
  description = "Name of your Application gateway. Will be prefixed and affixed."
  default     = "dojoappgw"
}
