#!/bin/bash

# Modified From: https://gist.github.com/cyrusboadway/5a7b715665f33c237996

# Add this to your crontab for autmated usage
# https://www.raspberrypi.org/documentation/linux/usage/cron.md
# Runs every 30 minutes
# */30 * * * * ./googleDomainsDynamicDns.sh

# Make sure we pass our version
if [ "$#" -ne 3 ]; then

  echo "USAGE:"
  echo "./googleDomainsDynamicDns.sh [USERNAME] [PASSWORD] [HOSTNAME]"

else

  # Update Google DNS Record
  URL="https://$1:$2@domains.google.com/nic/update?hostname=$3"

  echo " "
  echo " "

  echo "Making a Request to: $URL"

  echo "See response values here: https://support.google.com/domains/answer/6147083"

  echo " "
  echo " "

  curl -s $URL

  echo " "
  echo " "

  echo "Done!"

fi
