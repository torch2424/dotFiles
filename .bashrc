#!/usr/bin/env bash

# Load Bash Sexy theme
# https://github.com/twolfson/sexy-bash-prompt/blob/master/.bash_prompt
source ~/.sexy_bash.sh

# Load NVM
export NVM_DIR="/home/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Load our aliases
source .bash_aliases
