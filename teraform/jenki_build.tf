resource "azurerm_public_ip" "jenki_build" {
    name                = "${var.prefix_jenki_build}-publicip"
    location            = "${azurerm_resource_group.main.location}"
    resource_group_name = "${azurerm_resource_group.main.name}"
    allocation_method   = "Dynamic"
    domain_name_label   = "${var.aduserbuild}-${formatdate("DDMMYYhhmmss", timestamp())}"
}

resource "azurerm_network_interface" "jenki_build" {
  name                = "${var.prefix_jenki_build}-nic"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  network_security_group_id = "${azurerm_network_security_group.jenki_build.id}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.jenki_build.id}"
  }
}

resource "azurerm_virtual_machine" "jenki_build" {
  name                  = "${var.prefix_jenki_build}-vm"
  location              = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  network_interface_ids = ["${azurerm_network_interface.jenki_build.id}"]
  vm_size               = "${var.macsize}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.diskname_jenki_build}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.compname_jenki_build}"
    admin_username = "${var.aduserbuild}"
    admin_password = "${var.adpass}"
  }
  os_profile_linux_config {
    disable_password_authentication = false

    ssh_keys {
      path     = "/home/${var.aduserbuild}/.ssh/authorized_keys"
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }

  provisioner "remote-exec" {
	inline = ["apt update","sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre","git clone https://github.com/yamileon/cre_scripts.git",
            "sudo bash ~/cre_scripts/jenkins_installer_sh/insta_jenkins.sh"]
  	connection {
		type = "ssh"
		user = "${var.aduser}"
		private_key = file("~/.ssh/id_rsa")
		host = "${azurerm_public_ip.jenki_build.fqdn}"
  	}
  }
}