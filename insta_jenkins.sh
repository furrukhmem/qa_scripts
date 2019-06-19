#!/bin/bash

if [ $(which java) ]
then

	echo 'install script running'
	# create a jenkins user and make sure that a home directory is created for it
	sudo useradd --create-home jenkins

	# set the default shell for jenkins to be bash

	sudo usermod --shell /bin/bash jenkins

	sudo su - jenkins -c 'wget http://updates.jenkins-ci.org/latest/jenkins.war'
        
        #sudo su -jenkins -c 'cp /home/jenkins/jenkins.war /home/ser/Documents/jenkins.war'

	sudo cp ./jenki_config /etc/systemd/system/jenkins.service

	sudo systemctl daemon-reload

	sudo systemctl start jenkins

	sudo systemctl enable jenkins

else
	echo 'java not installed install it'
	echo 'sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre '
fi
