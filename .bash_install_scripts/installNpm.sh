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

# Echo npm without sudo
echo "If not using my dotFiles, use this stack overflow answer to set up npm without sudo: https://stackoverflow.com/questions/10081293/install-npm-into-home-directory-with-distribution-nodejs-package-ubuntu/13021677#13021677"

# Update npm
npm install -g npm

# install yeoman for testign
npm install --global yo --unsafe-perm
yo --version
