# ------------------------------------------------------------------------------------------
# This file used to configure versions of the providers used to provision workspace
# ------------------------------------------------------------------------------------------
terraform {
  required_version = ">=1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
  }
}
