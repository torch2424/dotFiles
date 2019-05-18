#/bin/bash

installSystemctlService() {
  echo "Copying to /etc/systemd/system"
  sudo cp $1 /etc/systemd/system
}

alias install-systemctl-service='installSystemctlService'
alias installsystemctlservice='installSystemctlService'
