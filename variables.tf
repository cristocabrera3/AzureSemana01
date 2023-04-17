# Definir las variables
variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "1-76bba910-playground-sandbox"
}

# Red Virtual 1
variable "virtual_network1_name" {
  default = "vnet1"
}
variable "virtual_network1_address_space" {
  default = "10.1.0.0/16"
}

# Subredes Red Virtual 1
variable "virtual_network1_subnet1_name" {
  default = "subnet1"
}
variable "virtual_network1_subnet1_address_prefix" {
  default = "10.1.1.0/24"
}

variable "virtual_network1_subnet2_name" {
  default = "subnet2"
}
variable "virtual_network1_subnet2_address_prefix" {
  default = "10.1.2.0/24"
}

variable "virtual_network1_subnet3_name" {
  default = "subnet3"
}
variable "virtual_network1_subnet3_address_prefix" {
  default = "10.1.3.0/24"
}

# Red Virtual 2
variable "virtual_network2_name" {
  default = "vnet2"
}
variable "virtual_network2_address_space" {
  default = "10.2.0.0/16"
}

# Subredes Red Virtual 2
variable "virtual_network2_subnet1_name" {
  default = "subnet1"
}
variable "virtual_network2_subnet1_address_prefix" {
  default = "10.2.1.0/24"
}

variable "virtual_network2_subnet2_name" {
  default = "subnet2"
}
variable "virtual_network2_subnet2_address_prefix" {
  default = "10.2.2.0/24"
}

variable "virtual_network2_subnet3_name" {
  default = "subnet3"
}
variable "virtual_network2_subnet3_address_prefix" {
  default = "10.2.3.0/24"
}

# Servidor
variable "server_name" {
  default = "example-server"
}

variable "server_username" {
  default = "adminuser"
}

variable "server_password" {
  default = "P@ssw0rd123"
}

variable "server_size"{
  default = "Standard_B2s"
}

variable "server_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "server_offer" {
  default = "WindowsServer"
}

variable "server_sku" {
  default = "2019-Datacenter"
}