#!/bin/bash

# Copies the passed file to /usr/local/bin to add to path.
# Using this for using prebuilt caddy

if [ "$#" -lt 1 ]; then
  echo "USAGE: ./copyCaddyToUsrLocalBin.sh : Copies the passed caddy file to /usr/local/bin/caddy"
  echo " "
  echo "./copyCaddyToUsrLocalBin.sh [caddy binary to be copied, e.g 'caddy-osx']"
else
  sudo cp $1 /usr/local/bin/caddy
  # Make caddy run as root for certificates
  sudo chown root:root /usr/local/bin/caddy
  sudo chmod 755 /usr/local/bin/caddy
  # Allow binding to low ports
  sudo setcap 'cap_net_bind_service=+ep' /usr/local/bin/caddy
fi
