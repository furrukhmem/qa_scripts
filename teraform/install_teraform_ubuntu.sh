#!/bin/bash

url=https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip

sudo apt update

sudo apt upgrade -y

sudo apt install -y unzip wget jq

wget $url

unzip terraform_*_linux_*.zip

sudo mv terraform /usr/local/bin

rm terraform_*_linux_*.zip

terraform --version