#!/bin/sh
while [ true ]
do
  goaccess ../access.log --log-format=VCOMBINED -e 127.0.0.1 -e 0.0.0.0 -o index.html
  sleep 60
done
