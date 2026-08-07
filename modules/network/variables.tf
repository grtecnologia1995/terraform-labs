variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Localização dos recursos"
  type        = string
}

variable "vnet_name" {
  description = "Nome da Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Espaço de endereços da Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Nome da Subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Prefixos de endereços da Subnet"
  type        = list(string)
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