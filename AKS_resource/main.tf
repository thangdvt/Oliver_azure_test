provider "azurerm" {
  features {}
  subscription_id = "f43dfad2-7616-404b-8932-e01229059371"
}

# Import existing resource group
data "azurerm_resource_group" "test_rg" {
  name = "Thangdv38-Test-RG"
}

# Call the Network Module
module "network" {
  source              = "./modules/network"
  resource_group_name = data.azurerm_resource_group.test_rg.name
  location            = data.azurerm_resource_group.test_rg.location
  vnet_name           = "aks-vnet"
  subnet_name         = "aks-subnet"
  vnet_cidr           = "10.10.0.0/24"
  subnet_cidr         = "10.10.0.0/26"
}

# Call the AKS Module
module "aks" {
  source              = "./modules/aks"
  resource_group_name = data.azurerm_resource_group.test_rg.name
  location            = data.azurerm_resource_group.test_rg.location
  vnet_subnet_id      = module.network.subnet_id
  dns_prefix          = "duakscluster"
  node_count          = 1
  vm_size             = "Standard_DS2_v2"
}
