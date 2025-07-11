resource "azurerm_role_assignment" "example" {
  scope                = azurerm_virtual_network.main.id
  role_definition_name = "Reader"
  principal_id         = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}