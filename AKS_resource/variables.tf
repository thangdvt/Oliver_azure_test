variable "vnet_name" {
  default = "aks-vnet"
}

variable "subnet_name" {
  default = "aks-subnet"
}

variable "vnet_cidr" {
  default = "10.10.0.0/24"
}

variable "subnet_cidr" {
  default = "10.10.1.0/26"
}

variable "dns_prefix" {
  default = "myakscluster"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_DS2_v2"
}
