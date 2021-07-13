#!/bin/bash
#add fix to exercise5-server1 here
ssh-keygen -q -t rsa -N '' <<< ""$'\n'"y" >/dev/null 2>&1
sudo apt update 
sudo apt install sshpass -y 
echo "12345" > password.txt
sshpass -f password.txt ssh-copy-id server2
echo "now you can ssh to server2 without password"
