output "resource_group_name" {
  description = "Nome do Resource Group criado"
  value       = azurerm_resource_group.rg-terraform.name
}

output "public_ip_address" {
  description = "IP público da máquina virtual"
  value       = azurerm_public_ip.public-ip-lab-01.ip_address
}

output "private_ip_address" {
  description = "IP privado da máquina virtual"
  value       = azurerm_network_interface.nic-lab-01.private_ip_address
}

output "ssh_command" {
  description = "Comando para acessar a máquina por SSH"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.public-ip-lab-01.ip_address}"
}