#!/bin/sh
while [ true ]
do
  # Staandard ouput
  echo " "
  echo "Generating index.html"
  echo " "
  cat ../access* | goaccess --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 -o index.html
  
  # JSON output
  echo " "
  echo "Generating index.json"
  echo " "
  cat ../access* | goaccess --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 -o index.json
  
  # No Crawlers Output
  echo " "
  echo "Generating ignorecrawlers.html"
  echo " "
  cat ../access* | goaccess --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 --ignore-crawlers -o ignorecrawlers.html

  # Sleep for a while
  echo " "
  echo "Sleeping..."
  echo " "
  sleep 2h
done
