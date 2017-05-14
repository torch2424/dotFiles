#!/bin/bash

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
