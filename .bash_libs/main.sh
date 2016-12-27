#!/usr/bin/env bash

#Function to source from the user's .bash_libs
_user-bash-libs-source() {
	source /home/$(whoami)/.bash_libs/$1;
}

# Function to source all files in folder
_source-all() {
	 for f in /home/$(whoami)/.bash_libs/sexy_prompt/*; do source $f; done;
}


# This file is meant for sourcing all imported libraries
_source-all sexy_prompt
_user-bash-libs-source JSON.sh/init_JSON.sh
