
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev_rg" {
  name     = "rg-devsecops-dev"
  location = "East US"
}

resource "azurerm_storage_account" "dev_storage" {
  name                     = "devsecopsstorage01"
  resource_group_name      = azurerm_resource_group.dev_rg.name
  location                 = azurerm_resource_group.dev_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
