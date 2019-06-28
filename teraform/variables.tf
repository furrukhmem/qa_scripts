provider "azurerm" {
	version = "=1.30.1"
}

variable "prefix-jenki" {
  default = "jenkins"
}

variable "compname" {
  default="testbot"
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