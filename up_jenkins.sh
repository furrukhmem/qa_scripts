#!/bin/bash

echo 'stopping jenkins'
sudo systemctl stop jenkins

sudo su - jenkins -c 'wget -N http://updates.jenkins-ci.org/latest/jenkins.war'

echo 'starting jenkins'
sudo systemctl start jenkins
sudo systemctl status jenkins
