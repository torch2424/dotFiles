#!/usr/bin/env bash

# Cool speedtest function, works by using wget
# (Which shows speed in kilobytes per second or Megabytes per second)
# And tries to download an ubuntu iso
# (Which has no affiliation to isps)
# to a directory that auto deletes itself
function __speedtest() {
  if [ "$#" -gt 0 ]; then
    wget -O/dev/null $1
  else
    wget -O/dev/null http://mirror.pnl.gov/releases/17.04/ubuntu-17.04-server-amd64.img
  fi
}

# Aliases
alias speedtest='__speedtest'

# Pacific Northwest Mirror capped at 10 Gbps
alias speedtest-us-west-mirror='speedtest http://mirror.pnl.gov/releases/17.04/ubuntu-17.04-server-amd64.img'
# Canadian Mirror capped at 4Gbps https://launchpad.net/ubuntu/+cdmirrors
alias speedtest-canada-mirror='speedtest http://ubuntu-cd.mirror.iweb.ca/17.04/ubuntu-17.04-server-amd64.img'
