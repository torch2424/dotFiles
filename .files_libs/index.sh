#!/usr/bin/env bash
# This file is meant for sourcing all imported libraries

#Source all function from .bashrc, load our theme, if interactive shell
if [[ $- == *i* ]]; then
    _source_all .files_libs/sexy_prompt
fi

# Write some aliases to wrap around imported libs
alias json="sh ~/.files_libs/JSON.sh < "
alias wifi="~/.files_libs/wifi.sh "
alias gifgen="~/.files_libs/gifgen.sh "
alias sshrc="~/.files_libs/sshrc.sh "
alias piShrink="~/.files_libs/piShrink.sh "
alias pishrink="piShrink"
