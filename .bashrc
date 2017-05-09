#!/usr/bin/env bash

#Fucntion to source from the user home directory
_user_source() {
	source ~/$1
}

# Function to source all files in folder
_source_all() {
	 for f in ~/$1/*.sh; do source $f; done;
}

# load our bash aliases
_user_source .bash_aliases.sh

# load our bash function
_source_all .bash_functions

# Load Our bash libraries
_user_source .bash_libs/index.sh

# Cache our Git credentials
git config --global credential.helper 'cache --timeout=36000'

# Set Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Old Config from GOGS Install and things
export NVM_DIR="/home/torch2424/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export NPM_PACKAGES="/home/torch2424/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Go Settings
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/goPath

#Set our OSX Java Path
export JAVA_HOME=`/usr/libexec/java_home`
# MFP For Work
export PATH="/Applications/IBM/MobileFirst-CLI:$PATH"

# Clear the console
clear

# Finally, load neo fetch if it is installed
if hash neofetch 2>/dev/null; then
        neofetch
fi
