#!/bin/bash
sudo apt-get install openssh-server
#make a backup of the configs
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
chmod a-w /etc/ssh/sshd_config.factory-defaults #remove write permissions to file
sudo systemctl restart ssh

#generate ssh keys
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa
