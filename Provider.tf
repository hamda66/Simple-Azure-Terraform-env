

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.6.0"
    }
  
    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }
  }
  
}

provider "azurerm" {
  # Configuration options

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    
  }
  
}


provider "random" {
  # Configuration options
}

