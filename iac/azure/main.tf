provider "azurerm" {
  features {}
}

module "network" {
  source = "./vnet"
}