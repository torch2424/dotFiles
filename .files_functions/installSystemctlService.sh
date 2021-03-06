#/bin/bash

installSystemctlService() {

  if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
    echo "installSystemctlService (Copy a service file to /etc/systemd/system) USAGE:"
    echo "installSystemctlService [service file]"
  else
    echo "Copying to /etc/systemd/system"
    sudo cp $1 /etc/systemd/system
  fi
}

alias install-systemctl-service='installSystemctlService'
alias installsystemctlservice='installSystemctlService'
alias iss='installsystemctlservice'
alias sscp='iss'
