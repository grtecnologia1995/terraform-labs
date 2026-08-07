# Resource Group - Terraform configuration for Azure
resource "azurerm_resource_group" "rg-terraform" {
  name     = var.resource_group_name
  location = var.location
 }

# Virtual Network - Terraform configuration for Azure
resource "azurerm_virtual_network" "vnet-lab-01" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-terraform.location
  resource_group_name = azurerm_resource_group.rg-terraform.name
}

# Subnet - Terraform configuration for Azure
resource "azurerm_subnet" "sub-lab-01" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg-terraform.name
  virtual_network_name = azurerm_virtual_network.vnet-lab-01.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Public IP - Terraform configuration for Azure
resource "azurerm_public_ip" "public-ip-lab-01" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg-terraform.location
  resource_group_name = azurerm_resource_group.rg-terraform.name
  allocation_method = "Static"
  sku               = "Standard"
}

# NSG - Terraform configuration for Azure
resource "azurerm_network_security_group" "nsg-lab-01" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg-terraform.location
  resource_group_name = azurerm_resource_group.rg-terraform.name

  security_rule {
    name                       = "Allow-SSH-From-My-IP"
    description                = "Permite SSH somente a partir do IP informado"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.allowed_ssh_cidr
    destination_address_prefix = "*"
  }
}

# NSG Association - Terraform configuration for Azure
resource "azurerm_subnet_network_security_group_association" "sub-lab-01" {
  subnet_id                 = azurerm_subnet.sub-lab-01.id
  network_security_group_id = azurerm_network_security_group.nsg-lab-01.id
}

# Nic - Terraform configuration for Azure
resource "azurerm_network_interface" "nic-lab-01" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg-terraform.location
  resource_group_name = azurerm_resource_group.rg-terraform.name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.sub-lab-01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip-lab-01.id
  }
}

#VM - Terraform configuration for Azure
resource "azurerm_virtual_machine" "vm-lab-01" {
  name                  = "vm-lab-01"
  location              = azurerm_resource_group.rg-terraform.location
  resource_group_name   = azurerm_resource_group.rg-terraform.name
  network_interface_ids = [azurerm_network_interface.nic-lab-01.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "disk-lab-01"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
  
