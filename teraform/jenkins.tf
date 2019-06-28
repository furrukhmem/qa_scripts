resource "azurerm_resource_group" "main" {
  name     = "${var.prefix-jenki}-resources"
  location = "uksouth"
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix-jenki}-vm"
  location              = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size               = "${var.macsize}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.compname}"
    admin_username = "${var.aduser}"
    admin_password = "${var.adpass}"
  }
  os_profile_linux_config {
    disable_password_authentication = false

    ssh_keys {
      path     = "/home/${var.aduser}/.ssh/authorized_keys"
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
		host = "${azurerm_public_ip.main.fqdn}"
  	}
  }
}