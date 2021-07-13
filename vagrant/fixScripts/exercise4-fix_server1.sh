#!/bin/bash
#add fix to exercise4-server1 here
sudo echo "192.168.100.11       server2" >> /etc/hosts
sudo sed -i  "s/PasswordAuthentication no/PasswordAuthentication yes/1" /etc/ssh/sshd_config
sudo service sshd restart 
echo "vagrant:12345" | sudo chpasswd

