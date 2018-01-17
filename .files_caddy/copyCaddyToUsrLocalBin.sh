#!/bin/bash

# Copies the passed file to /usr/local/bin to add to path.
# Using this for using prebuilt caddy

if [ "$#" -lt 1 ]; then
  echo "USAGE: ./copyCaddyToUsrLocalBin.sh : Copies the passed caddy file to /usr/local/bin/caddy"
  echo " "
  echo "./copyCaddyToUsrLocalBin.sh [caddy binary to be copied, e.g 'caddy-osx']"
else
  sudo cp $1 /usr/local/bin/caddy
fi
