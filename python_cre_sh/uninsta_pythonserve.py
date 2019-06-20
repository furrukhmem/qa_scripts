#!/bin/bash

sudo systemctl stop pythonserve
sudo rm /etc/systemd/system/pythonserve.service
sudo userdel -r pythonadm

echo 'userdeleted'
