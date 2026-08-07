variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Localização da VM"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet onde a VM será conectada"
  type        = string
}

variable "vm_windows_name" {
  description = "Nome da máquina virtual"
  type        = string
}

variable "vm_size" {
  description = "Tamanho da máquina virtual"
  type        = string
  default     = "Standard_B2s"
}

variable "username" {
  description = "Usuário administrador da VM"
  type        = string
}

variable "passwd" {
  description = "Senha do administrador da VM"
  type        = string
  sensitive   = true
}