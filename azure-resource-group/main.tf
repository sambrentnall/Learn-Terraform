# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# save tf state in container
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "sambtfstorageaccount"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}

# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.resourcename}ResourceGroup"
  location = var.azure_location
}