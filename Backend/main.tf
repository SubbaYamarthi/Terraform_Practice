terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "RG-tfstate"
        storage_account_name = "strtfstatesubba"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}

provider "azurerm" {
  features {}
}


module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "TerraformterraformExample01"
  location = "West US"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}
