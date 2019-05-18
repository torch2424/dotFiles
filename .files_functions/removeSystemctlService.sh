#/bin/bash

removeSystemctlService() {
  echo "Removing /etc/systemd/system/$1"
  rm /etc/systemd/system$(basename $1)
}

alias remove-systemctl-service='removeSystemctlService'
alias removesystemctlservice='removeSystemctlService'
