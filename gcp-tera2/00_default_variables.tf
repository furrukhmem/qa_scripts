variable "project" {
	default = "seventh-port-246109"
}

variable "name" {
	default = "default"
}

variable "machine_type" {
	default = "g1-small"
}

variable "zone" {
	default = "europe-west2-c"
}

variable "image" {
	default = "ubuntu-1804-lts"
}

variable "network" {
	default = "default"
}

variable "ssh_user" {
	default = "terraform"
}

variable "public_key" {
	default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
	default = "~/.ssh/id_rsa"
}

variable "package_manager" {
	default = "apt"
}

variable "update_packages" {
	default = {
		"yum" = "sudo yum update -y",
		"apt" = "sudo apt update"
	}
}

variable "packages" {
	default = [
		"wget",
		"unzip"
	]
}

variable "install_packages" {
	default = {
		"yum" = "sudo yum install -y",
		"apt" = "sudo apt install -y"
	}
}

variable "scripts" {
	default = []
}

variable "allowed_ports" {
	default = ["22"]
}
