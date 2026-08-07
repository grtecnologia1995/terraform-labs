resource "azurerm_resource_group" "rg-lab-02" {
  name     = var.resource_group_name
  location = var.location
}