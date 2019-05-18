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
  # https://www.thegeekstuff.com/2011/07/rsync-over-ssh-without-password/
  rsync -avz -e ssh ../logs/access* torch2424@proxy.aaronthedev.com:/home/torch2424/.files_caddy/aaronTheDev-proxy/logs


  # Sleep for a while
  echo " "
  echo "Sleeping..."
  echo " "
  sleep 2h
done
