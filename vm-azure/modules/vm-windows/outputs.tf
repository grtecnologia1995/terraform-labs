output "vm_id" {
  description = "ID da máquina virtual"
  value       = azurerm_windows_virtual_machine.vm-ws-lab-02.id
}

output "vm_name" {
  description = "Nome da máquina virtual"
  value       = azurerm_windows_virtual_machine.vm-ws-lab-02.name
}

output "private_ip_address" {
  description = "Endereço IP privado da VM"
  value       = azurerm_network_interface.nic.private_ip_address
}