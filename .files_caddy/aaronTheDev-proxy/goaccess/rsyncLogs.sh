#!/bin/bash
while [ true ]
do
  
  # Some intro
  echo " "
  echo "Running goaccess logs..."
  echo "Current Directory:"
  pwd
  echo " "

  # rsync the logs to the main proxy server
  # https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
  rsync -avz -e 'ssh -p 1124' ../logs/access* torch2424@proxy.aaronthedev.com:/home/torch2424/.files_caddy/aaronTheDev-proxy/logs


  # Sleep for a while
  echo " "
  echo "Sleeping..."
  echo " "
  sleep 2h
done
