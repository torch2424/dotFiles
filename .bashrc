#!/usr/bin/env bash

#Fucntion to source from the user home directory
_user_source() {
	source /home/$(whoami)/$1
}

# Function to source all files in folder
_source_all() {
	 for f in /home/$(whoami)/$1/*.sh; do source $f; done;
}

# load our bash aliases
_user_source .bash_aliases.sh

# load our bash function
_source_all .bash_functions

# Load Our bash libraries
_user_source .bash_libs/index.sh

# Load NVM
export NVM_DIR="/home/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
