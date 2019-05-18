#!/bin/bash
while [ true ]
do
  
  # Some intro
  echo " "
  echo "Running goaccess logs..."
  echo "Current Directory:"
  pwd
  echo " "

  # Cat all logs into a file
  echo " "
  echo "Cat all logs into file..."
  echo " "
  cat /home/torch2424/.files_caddy/aaronTheDev-proxy/logs/access* > /tmp/generateGoaccess.txt

  # Standard ouput
  echo " "
  echo "Generating index.html"
  echo " "
  goaccess /tmp/generateGoaccess.txt --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 --ignore-crawlers -o index.html
  
  # JSON output
  echo " "
  echo "Generating index.json"
  echo " "
  goaccess /tmp/generateGoaccess.txt --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 --ignore-crawlers -o index.json
  
  # No Crawlers Output
  echo " "
  echo "Generating withcrawlers.html"
  echo " "
  goaccess /tmp/generateGoaccess.txt --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 -o withcrawlers.html

  # Sleep for a while
  echo " "
  echo "Sleeping..."
  echo " "
  sleep 2h
done
