# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# create resource group with location from variable
resource "azurerm_resource_group" "rg" {
  name     = "${var.resourcename}ResourceGroup"
  location = var.azure_location
}