# Use Azure Storage Container for .tfstate file
terraform {
  backend "azurerm" {
    resource_group_name  = "sambfstates"
    storage_account_name = "sambtf"
    container_name       = "sambdevops"
    key                  = "sambdevops.tfstate"
  }
}

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

data "azurerm_client_config" "current" {}

# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = "Terraform_RG"
  location = "uksouth"
}