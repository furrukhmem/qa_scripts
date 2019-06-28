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
#------------------------------------------------------------
variable "prefix_jenki_build" {
  default = "jenkiBuild"
}

variable "compname_jenki_build" {
  default="jenkiBuild"
}

variable "diskname_jenki_build" {
  default="jenkibuilddisk"
}
#---------------------------------------------------------------
variable "prefix_pyserver" {
  default = "pyslave"
}

variable "compname_pyserver" {
  default="pyslave"
}

variable "diskname_pyserver" {
  default = "pyslavedisk"
}
#-----------------------------------------------------------------
variable "aduser" {
  default="ser"
}

variable "aduserbuild" {
  default="ser1"
}

variable "aduserpy" {
  default="ser2"
}

variable "adpass" {
  default="Zxcvbnm123!"
}

variable "macsize" {
  default="Standard_B1s"
}