output "resource_group_name" {
  description = "Nome do Resource Group criado"
  value       = module.resource_group.resource_group_name
}

output "location" {
  description = "Localização do Resource Group"
  value       = module.resource_group.resource_group_location
}

output "vnet_id" {
  description = "ID da Virtual Network"
  value       = module.network.vnet_id
}

output "vnet_name" {
  description = "Nome da Virtual Network"
  value       = module.network.vnet_name
}

output "subnet_id" {
  description = "ID da subnet das máquinas virtuais"
  value       = module.network.subnet_id
}

output "vm_id" {
  description = "ID da máquina virtual Windows"
  value       = module.vm_windows.vm_id
}

output "vm_name" {
  description = "Nome da máquina virtual Windows"
  value       = module.vm_windows.vm_name
}

output "private_ip_address" {
  description = "Endereço IP privado da máquina virtual"
  value       = module.vm_windows.private_ip_address
}