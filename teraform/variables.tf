provider "azurerm" {
	version = "=1.30.1"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix_jenki}-resources"
  location = "uksouth"
}

variable "prefix_jenki" {
  default = "jenkins"
}

variable "compname_jenki" {
  default="jenkins"
}

variable "diskname_jenki" {
  default="jenkidisk"
}

variable "prefix_jenki_build" {
  default = "jenkiBuild"
}

variable "compname_jenki_build" {
  default="jenkiBuild"
}

variable "diskname_jenki_build" {
  default="jenkibuilddisk"
}

variable "prefix_py" {
  default = "pyslave"
}

variable "compname_py" {
  default="pyslave"
}

variable "diskname_pyslave" {
  default = "pyslavedisk"
}

variable "aduser" {
  default="ser"
}

variable "adpass" {
  default="Zxcvbnm123!"
}

variable "macsize" {
  default="Standard_B2s"
}