variable "subscription_id" {
  description = "ID da subscription do Azure onde os recursos serão criados"
  type        = string

  validation {
    condition     = length(trimspace(var.subscription_id)) > 0
    error_message = "O ID da subscription não pode ficar vazio."
  }
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Região dos recursos no Azure"
  type        = string
}

variable "vnet_name" {
  description = "Nome da Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Espaço de endereçamento da Virtual Network"
  type        = list(string)

  validation {
    condition     = length(var.vnet_address_space) > 0
    error_message = "Informe pelo menos um CIDR para a VNet."
  }
}

variable "subnet_name" {
  description = "Nome da subnet das máquinas virtuais"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Faixa de endereços da subnet"
  type        = list(string)

  validation {
    condition     = length(var.subnet_address_prefixes) > 0
    error_message = "Informe pelo menos um CIDR para a subnet."
  }
}

variable "vm_windows_name" {
  description = "Nome da máquina virtual Windows"
  type        = string
}

variable "vm_size" {
  description = "Tamanho da máquina virtual"
  type        = string
  default     = "Standard_B2s"
}

variable "username" {
  description = "Usuário administrador da máquina virtual"
  type        = string
}

variable "passwd" {
  description = "Senha do administrador da máquina virtual"
  type        = string
  sensitive   = true
}

variable "nsg_name" {
  description = "Nome do Network Security Group"
  type        = string
}

variable "allowed_rdp_cidr" {
  description = "Endereço IP autorizado a acessar a porta RDP, no formato CIDR, por exemplo 200.100.50.25/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.allowed_rdp_cidr, 0))
    error_message = "Informe um endereço CIDR válido, por exemplo 200.100.50.25/32."
  }
}