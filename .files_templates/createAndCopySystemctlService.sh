#!/bin/bash

# Creates a systemctl service with correct usage

# Helper function
# https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/
# $1: What to search for
# $2: replacement
# $3 file
__find_and_replace_in_file() {
  sed -i -e "s/$1/$2/g" $3
}

# Helper function from: https://github.com/torch2424/bebop.sh/blob/master/bebop.sh
__seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

# Helper function from: https://github.com/torch2424/bebop.sh/blob/master/bebop.sh
__is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

if [ "$#" -lt 3 ]; then
  echo "USAGE: ./createAndCopySystemctlService.sh : Generate systemctl service for the current user, and copies to /etc/systemd/system, as well as keeps a copy in current directory"
  echo " "
  echo "./createAndCopySystemctlService.sh [service name without .service] [Directory to navigate to] [Command to run in quotes]"
else

  # Copy the cyctemctl service to temp
  cp systemctl.service /tmp/tmpSystemctl.service
  __find_and_replace_in_file "\[USER\]" "$(whoami)" /tmp/tmpSystemctl.service

  DIRECTORY=$(realpath $2)
  #https://unix.stackexchange.com/questions/265267/bash-converting-path-names-for-sed-so-they-escape/265572
  DIRECTORY_ESCAPED=${DIRECTORY//\//\\/}
  __find_and_replace_in_file "\[DIRECTORY\]" "$DIRECTORY_ESCAPED" /tmp/tmpSystemctl.service

  __find_and_replace_in_file "\[COMMAND\]" "$3" /tmp/tmpSystemctl.service

  echo " "
  echo "Resulting $1.service file..."
  echo " "

  cat /tmp/tmpSystemctl.service

  echo " "
  __seek_confirmation "Does this look okay?"

  if __is_confirmed; then
    cp /tmp/tmpSystemctl.service "./$1.service"
    sudo cp /tmp/tmpSystemctl.service "/etc/systemd/system/$1.service"
    echo " "
    echo "Copied to ./$1.service, and /etc/systemd/system/$1.service"
    echo " "
    echo "Done!"
    echo " "
    echo "NOTE: If this service needs to be restarted by a script, but dont want to get prompted for password"
    echo "Check out: https://askubuntu.com/questions/692701/allowing-user-to-run-systemctl-systemd-services-without-password"
    echo "Edit sudoers file with 'sudo visudo -f /etc/sudoers' and then add: 'MY_USER ALL=NOPASSWD: /bin/systemctl'"
    echo "And make sure to use sudo /bin/systemctl , not just sudo systemctl"
    echo " "
  else
    echo " "
    echo "Cancelled."
    echo " "
  fi
fi
