#!/bin/bash
#add fix to exercise4-server2 here
sudo echo "192.168.100.10       server1" >> /etc/hosts
sudo sed -i  "s/PasswordAuthentication no/PasswordAuthentication yes/1" /etc/ssh/sshd_config
sudo service sshd restart
echo "vagrant:12345" | sudo chpasswd
