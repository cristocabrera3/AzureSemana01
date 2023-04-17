provider "azurerm" {
  use_msi = true
  skip_provider_registration = true
  features {}
}

# Importar el grupo de recursos default
data "azurerm_resource_group" "defaultgroup" {
  name     = var.resource_group_name
}

# Crear la primera red virtual y sus subredes
resource "azurerm_virtual_network" "vnet1" {
  name                = var.virtual_network1_name
  location            = data.azurerm_resource_group.defaultgroup.location
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  address_space       = [var.virtual_network1_address_space]
}

resource "azurerm_subnet" "vnet1_subnet1" {
  name           = var.virtual_network1_subnet1_name
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [var.virtual_network1_subnet1_address_prefix]
}
resource "azurerm_subnet" "vnet1_subnet2" {
  name           = var.virtual_network1_subnet2_name
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [var.virtual_network1_subnet2_address_prefix]
}
resource "azurerm_subnet" "vnet1_subnet3" {
  name           = var.virtual_network1_subnet3_name
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [var.virtual_network1_subnet3_address_prefix]
}

# Crear la segunda red virtual y su subred
resource "azurerm_virtual_network" "vnet2" {
  name                = var.virtual_network2_name
  location            = data.azurerm_resource_group.defaultgroup.location
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  address_space       = [var.virtual_network2_address_space]
}

resource "azurerm_subnet" "vnet2_subnet1" {
  name           = var.virtual_network2_subnet1_name
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes = [var.virtual_network2_subnet1_address_prefix]
}
resource "azurerm_subnet" "vnet2_subnet2" {
  name           = var.virtual_network2_subnet2_name
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes = [var.virtual_network2_subnet2_address_prefix]
}
resource "azurerm_subnet" "vnet2_subnet3" {
  name           = var.virtual_network2_subnet3_name
  resource_group_name = data.azurerm_resource_group.defaultgroup.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes = [var.virtual_network2_subnet3_address_prefix]
}

# Crear una interfaz de red
resource "azurerm_network_interface" "example" {
  name                = "${var.server_name}-nic"
  location            = data.azurerm_resource_group.defaultgroup.location
  resource_group_name = data.azurerm_resource_group.defaultgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vnet1_subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Crear una máquina virtual
resource "azurerm_windows_virtual_machine" "example" {
  name                  = var.server_name
  resource_group_name   = data.azurerm_resource_group.defaultgroup.name
  location              = data.azurerm_resource_group.defaultgroup.location
  size                  = var.server_size
  admin_username        = var.server_username
  admin_password        = var.server_password
  network_interface_ids = [azurerm_network_interface.example.id]
  os_disk {
    name                 = "${var.server_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.server_publisher
    offer     = var.server_offer
    sku       = var.server_sku
    version   = "latest"
  }
  depends_on = [
    azurerm_subnet.vnet1_subnet1,
    azurerm_network_interface.example
  ]
}
