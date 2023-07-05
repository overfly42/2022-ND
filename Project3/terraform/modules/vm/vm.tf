resource "azurerm_network_interface" "test" {
  name                = "internal_network"
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
  network_interface_ids = ["${azurerm_network_interface.test.id}"]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("/home/christian/.ssh/id_rsa_udacity2022p3.pub")
  }
  source_image_id = "/subscriptions/a7f4943c-0527-4918-98af-14af18d4cebf/resourceGroups/Udacity_cs/providers/Microsoft.Compute/galleries/vmgallery/images/test-vm"
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
 # source_image_reference {
 #   publisher = "cs"
#    publisher = "Canonical"
#    offer     = "0001-com-ubuntu-server-focal"
#    sku       = "18.04-LTS"
#    sku = "20_04-lts-gen2"
#    version   = "latest"
#  }
}
