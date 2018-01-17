#!/bin/bash

#Find a line containing the text, and replace the entire line with the other passed text
#Reference: http://stackoverflow.com/questions/11245144/replace-whole-line-containing-a-string-using-sed
#@param $1 - The First argument, The Text to be found in a file
#@param $2 - The second argument, the line the will be replacing the entire first line
#@param $3 - The Third/Last argument, the file this function will be run against
find-replace-line() {
    sudo sed -i "s/^$1.*/$2/" $3
}

# Install fail2ban
sudo apt-get update
sudo apt-get install -y fail2ban

# Copy into a jail.local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Replace some lines in the file
find-replace-line "bantime  =" "bantime  = 10000000" /etc/fail2ban/jail.local
find-replace-line "findtime  =" "findtime  = 6000" /etc/fail2ban/jail.local
find-replace-line "maxretry =" "maxretry = 10" /etc/fail2ban/jail.local

# Enable for SSH
# Remember we need to escape special characters!!!
find-replace-line "\[sshd\]" "[sshd]\nenable = true" /etc/fail2ban/jail.local

# Restart fail2ban
sudo service fail2ban stop
sudo service fail2ban start

# Show the iptables to prove it is working
sudo iptables -S
