#!/usr/bin/env bash
# This file is meant for sourcing all imported libraries

#Source all function from .bashrc, load our theme
_source_all .bash_libs/sexy_prompt

# Write some aliases to wrap around imported libs
alias json="sh ~/.bash_libs/JSON.sh < "
alias wifi="~/.bash_libs/wifi.sh "
alias gifgen="~/.bash_libs/gifgen.sh "
alias sshrc="~/.bash_libs/sshrc.sh "
