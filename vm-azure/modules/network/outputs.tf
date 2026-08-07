output "vnet_id" {
  description = "ID da Virtual Network"
  value       = azurerm_virtual_network.vnet-lab-02.id
}

output "vnet_name" {
  description = "Nome da Virtual Network"
  value       = azurerm_virtual_network.vnet-lab-02.name
}

output "subnet_id" {
  description = "ID da subnet das máquinas virtuais"
  value       = azurerm_subnet.subnet-lab-02.id
}