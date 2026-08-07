variable "subscription_id" {
  description = "ID da subscription do Azure onde os recursos serão criados"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Região do Azure onde os recursos serão criados"
  type        = string
}

variable "admin_username" {
  description = "Nome do usuário administrador da máquina virtual"
  type        = string
  default     = "azadmin"

  validation {
    condition = (
      length(var.admin_username) >= 1 &&
      length(var.admin_username) <= 32 &&
      can(regex("^[a-zA-Z][a-zA-Z0-9_-]*$", var.admin_username)) &&
      !contains(
        [
          "admin",
          "administrator",
          "root",
          "guest",
          "user",
          "test"
        ],
        lower(var.admin_username)
      )
    )

    error_message = "O usuário deve ter entre 1 e 32 caracteres, começar com uma letra, utilizar somente letras, números, hífen ou underline e não pode ser um nome reservado."
  }
}

variable "admin_password" {
  description = "Senha do usuário administrador da máquina virtual"
  type        = string
  sensitive   = true

  validation {
    condition = (
      length(var.admin_password) >= 12 &&
      length(var.admin_password) <= 123 &&
      can(regex("[A-Z]", var.admin_password)) &&
      can(regex("[a-z]", var.admin_password)) &&
      can(regex("[0-9]", var.admin_password)) &&
      can(regex("[^A-Za-z0-9]", var.admin_password))
    )

    error_message = "A senha deve ter entre 12 e 123 caracteres e conter letra maiúscula, letra minúscula, número e caractere especial."
  }
}

variable "network_name" {
  description = "Nome da rede virtual"
  type        = string
}

variable "subnet_name" {
  description = "Nome da subnet"
  type        = string
}

variable "public_ip_name" {
  description = "Nome do IP público"
  type        = string
}

variable "nsg_name" {
  description = "Nome do grupo de segurança de rede"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Endereço IP autorizado a acessar a porta SSH, no formato CIDR, por exemplo 200.100.50.25/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.allowed_ssh_cidr, 0))
    error_message = "Informe um endereço CIDR válido, por exemplo 200.100.50.25/32."
  }
}

variable "nic_name" {
  description = "Nome da interface de rede"
  type        = string
}

