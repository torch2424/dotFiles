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

if [ "$#" -lt 2 ]; then
  echo "USAGE: ./createAndCopySystemctlService.sh : Generate systemctl service for the current user, and copies to /etc/systemd/system, as well as keeps a copy in current directory"
  echo " "
  echo "./createAndCopySystemctlService.sh [Directory to navigate to in quotes] [Command to run in quotes]"
else

  # Copy the cyctemctl service to temp
  cp systemctl.service /tmp/tmpSystemctl.service
  __find_and_replace_in_file "\[USER\]" "$(whoami)" /tmp/tmpSystemctl.service

  DIRECTORY=$(realpath $1)
  #https://unix.stackexchange.com/questions/265267/bash-converting-path-names-for-sed-so-they-escape/265572
  DIRECTORY_ESCAPED=${DIRECTORY//\//\\/}
  __find_and_replace_in_file "\[DIRECTORY\]" "$DIRECTORY_ESCAPED" /tmp/tmpSystemctl.service

  __find_and_replace_in_file "\[COMMAND\]" "$2" /tmp/tmpSystemctl.service

  echo " "
  echo "Resulting .service file..."
  echo " "

  cat /tmp/tmpSystemctl.service

  echo " "
  __seek_confirmation "Does this look okay?"

  if __is_confirmed; then
    cp /tmp/tmpSystemctl.service .
    sudo cp /tmp/tmpSystemctl.service /etc/systemd/system
    echo " "
    echo "Copied to current directory, and /etc/systemd/system"
    echo " "
  else
    echo " "
    echo "Cancelled."
    echo " "
  fi
fi
