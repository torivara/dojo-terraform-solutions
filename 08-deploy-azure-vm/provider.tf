# ------------------------------------------------------------------------------------------
# This file used to configure providers for your workspace.
# Azurerm provider should be present for correct configuration.
# ------------------------------------------------------------------------------------------
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstates-dojo-rg"
    storage_account_name = "dojotfstates20240222"
    container_name       = "labuser01tfstate"
    key                  = "terraformstate.tfstate"
  }
}

provider "azurerm" {
  features {}
}
