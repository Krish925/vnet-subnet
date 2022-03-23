provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.97.0"
    }
  }
}

resource "azurerm_resource_group" "sample-aks" {
  name     = "demo-aks"
  location = "EastUS"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "DemoNSG"
  location            = azurerm_resource_group.sample-aks.location
  resource_group_name = azurerm_resource_group.sample-aks.name
}

resource "azurerm_virtual_network" "Vnet" {
  name                = "DemoVnet"
  location            = azurerm_resource_group.sample-aks.location
  resource_group_name = azurerm_resource_group.sample-aks.name
  address_space       = ["10.240.0.0/16"]
  dns_servers         = ["10.240.0.4", "10.240.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.240.0.0/16"
  }
  tags = {
    environment = "dev"
  }
}
