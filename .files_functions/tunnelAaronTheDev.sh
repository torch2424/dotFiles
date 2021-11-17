#!/bin/bash

: '

ABOUT:

ngrok / localtunnel funcitonality over ssh

Follows this guide: https://blog.rodneyrehm.de/archives/38-You-may-not-need-localtunnel-or-ngrok.html

TL;DR

------------------------------------------

On your remote server, inside /etc/ssh/sshd_config add:

AllowTcpForwarding yes
GatewayPorts yes


Then to expose your port:

ssh -p ${sshPort} ${user}@${remoteServer} -N -R ${remoteHttpPort}:localhost:${localHttpPort}
'

aaronTheDevHttpPortShare() {

  if [ "$#" -ne 2 ]; then
    echo " "
    echo "USAGE:"
    echo "./aaronTheDevHttpPortShare [user] [localPort]"
    echo " "
  else

    echo "Connecting to $1@apps-11-2021.aaronthedev.com -p 1124."
    echo "Remote Url: http://apps-11-2021.aaronthedev.com:9090 or https://tunnel.aaronthedev.com"
    echo " "
    echo "NOTE: Service will continue to run without confirmation of successful connection."
    echo " "

    ssh -p 1124 "$1"@apps-11-2021.aaronthedev.com -N -R 9091:localhost:"$2"
  fi
}

# Some brand name aliases
alias shareport='aaronTheDevHttpPortShare'
alias portshare='shareport'
alias sp='shareport'
alias tunnel='sp'
