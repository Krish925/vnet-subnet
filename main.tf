provider "azurerm" {
  features {}
  subscription_id = "edbc0c8c-4f47-4144-9955-b82917b2b2a4"
  client_id       = "3e42e0f0-64a7-4b6b-8fd3-e90c22fadd39"
  client_secret   = "zzh7Q~LqA6Vdt8JwDQw7SGtBn207-CrIMTlRn"
  tenant_id       = "695c192d-463b-4c24-9631-508d0d0b9431"
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
