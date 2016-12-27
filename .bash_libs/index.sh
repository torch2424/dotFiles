#!/usr/bin/env bash

# Function to source all files in folder
_source-all() {
	 for f in /home/$(whoami)/.bash_libs/sexy_prompt/*; do source $f; done;
}


# This file is meant for sourcing all imported libraries
_source-all sexy_prompt

# Write some aliases to wrap around imported libs
alias json="sh /home/$(whoami)/.bash_libs/JSON.sh < "
alias wifi="/home/$(whoami)/.bash_libs/wifi.sh "
alias gifgen="/home/$(whoami)/.bash_libs/gifgen.sh "
