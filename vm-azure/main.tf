module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name     = module.resource_group.resource_group_name
  location                = module.resource_group.resource_group_location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  nsg_name                = var.nsg_name
  allowed_rdp_cidr        = var.allowed_rdp_cidr
}

module "vm_windows" {
  source = "./modules/vm-windows"

  vm_windows_name = var.vm_windows_name
  vm_size         = var.vm_size
  username        = var.username
  passwd          = var.passwd

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  subnet_id = module.network.subnet_id
}