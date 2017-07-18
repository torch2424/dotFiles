#!/bin/bash

# Don't allow running as root, as it will not work
if [ "$EUID" == 0 ]
then echo "Do not run as root. Run as your user to get nvm, and no sudo npm install -g working :)"
   exit
fi

#Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source ~/.bashrc

#Install Node
nvm install stable
node -v

# Echo how to set global npm packages in Home directory
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
