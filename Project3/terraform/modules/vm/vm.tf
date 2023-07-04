resource "azurerm_network_interface" "test" {
  name                = "internal network"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.publicip_id}"
  }
}

resource "azurerm_linux_virtual_machine" "myVM" {
  name                = "myVM"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "adminuser"
  tags = {
    selenium = "True"
  }
  network_interface_ids = ["${azurerm_network_interface.test}"]
  admin_ssh_key {
    username   = "adminuser"
    public_key = "file('~/.ssh/id_rsa_udacity2022p3.pub')"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "cs"
#    publisher = "Canonical"
    offer     = "UbuntuServer"
#    sku       = "18.04-LTS"
    sku = "1.0.0"
    version   = "latest"
  }
}
