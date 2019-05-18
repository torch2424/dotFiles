#/bin/bash

removeSystemctlService() {
  if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
    echo "removeSystemctlService USAGE:"
    echo "removeSystemctlService [service file]"
  else
    echo "Removing /etc/systemd/system/$1"
    rm /etc/systemd/system/$(basename $1)
  fi
}

alias remove-systemctl-service='removeSystemctlService'
alias removesystemctlservice='removeSystemctlService'
alias rss='removesystemctlservice'
