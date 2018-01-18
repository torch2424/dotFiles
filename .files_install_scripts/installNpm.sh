#!/bin/bash

# Bebop helper functions
# https://github.com/torch2424/bebop.sh/blob/master/bebop.sh
__seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}
__is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

# Don't allow running as root, as it will not work
if [ "$EUID" == 0 ]
then echo "Do not run as root. Run as your user to get nvm, and no sudo npm install -g working :)"
   exit
fi

# Ask if can download and run the nvm install script
echo " "
echo "To install Node/Npm, we will be using nvm"
echo "The best way to install nvm is by using the install script provided on the github repo."
echo "Which can be done with: 'curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash'"
echo "Please confirm that the following bash script is okay:"
echo " "
echo "https://raw.githubusercontent.com/creationix/nvm/master/install.sh"
echo " "
__seek_confirmation "Is it alright to run this script?"

if __is_confirmed; then
  #Install NVM (Node Version Manager)
  mkdir $HOME/.nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
  source ~/.bashrc
else
  echo " "
  echo "Please install nvm manually at: https://github.com/creationix/nvm"
  echo " "
  exit 1
fi

# Check nvm to be installed
nvm --version > /dev/null
if [ $? -eq 0 ]; then
  echo " "
  echo "Installing latest stable Node using nvm..."
  echo " "

  #Install Node
  nvm install stable
  node -v

  # Echo how to set global npm packages in Home directory
  echo " "
  echo "PLEASE READ THIS:"
  echo 'npm is notorious for getting permissions messed up, for using "sudo npm install -g ..." in inappropriate places'
  echo "If you would like to have global packages installed to your home directory, and this is reccomended, please add the following to your .bashrc"
  echo 'Please note, if you do enable this, you will no longer need "sudo npm install -g .." and you should not be using sudo for this, as the packages are installed in your home directory'
  echo "------------------------------------------"
  echo "~/.bashrc"
  echo " "
  echo '# Npm no Sudo
  export NPM_PACKAGES="~/.npm-packages"
  export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
  export PATH="$NPM_PACKAGES/bin:$PATH"
  # Unset manpath so we can inherit from /etc/manpath via the `manpath`
  # command
  unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
  export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"'

  echo " "
  echo "Welome to the world of Node.js!"
  echo " "
else
  echo " "
  echo "Nvm is not installed, please check your ~/.bashrc to ensure it is in your PATH, or that if it installed correctly."
  echo " "
  exit 1
fi
