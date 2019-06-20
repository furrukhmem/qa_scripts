#!/bin/bash

if [ $(which java) ]
then

	echo 'install script running'
	# create a jenkins user and make sure that a home directory is created for it
	sudo useradd --create-home pythonadm

	# set the default shell for jenkins to be bash

	sudo usermod --shell /bin/bash pythonadm

	sudo cp ./py_config /etc/systemd/system/pythonserve.service

	sudo systemctl daemon-reload

	sudo systemctl start pythonserve

	sudo systemctl enable pythonserve

else
	echo 'java not installed install it'
	echo 'sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre '
fi
