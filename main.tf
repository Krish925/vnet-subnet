resource "azurerm_resource_group" "sample-aks" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group
  location            = azurerm_resource_group.sample-aks.location
  resource_group_name = azurerm_resource_group.sample-aks.name
}

resource "azurerm_virtual_network" "Vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.sample-aks.location
  resource_group_name = azurerm_resource_group.sample-aks.name
  address_space       = ["10.240.0.0/16"]
  dns_servers         = ["10.240.0.4", "10.240.0.5"]

  subnet {
    name           = var.subnet
    address_prefix = "10.240.0.0/16"
  }
  tags = {
    environment = "dev"
  }
}
