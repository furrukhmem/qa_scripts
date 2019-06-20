#!/bin/bash

sudo systemctl stop jenkins
sudo rm /etc/systemd/system/jenkins.service
sudo userdel -r jenkins

echo 'userdeleted'
