# subscription ID
subscription_id = "69f58db1-f978-4fad-a432-65e42d75d7db"

# Resource Group
resource_group_name = "rg-lab-02"
location            = "East US"

# Virtual Network
vnet_name          = "vnet-lab-02"
vnet_address_space = ["10.10.0.0/16"]

# Subnet das máquinas virtuais
subnet_name             = "snet-vm"
subnet_address_prefixes = ["10.10.1.0/24"]

# Máquina virtual Windows
vm_windows_name = "vm-ws-lab-02"
vm_size         = "Standard_B2s"

# Credenciais
username = "azureadmin"
passwd   = "Kael2013@Mae"

# IP publico autorizado a acessar a porta RDP da máquina virtual, no formato CIDR, por exemplo

allowed_rdp_cidr = "191.13.208.229/32"

# NSG 
nsg_name = "nsg-lab-02"