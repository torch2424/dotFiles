#!/usr/bin/env bash
# This file is meant for sourcing all imported libraries

# Sexy Prompt is loaded from the .bashrc, that way it can easily be disabled for terminal recordings

# Write some aliases to wrap around imported libs
alias json="sh ~/.files_libs/JSON.sh < "
alias wifi="~/.files_libs/wifi.sh "
alias gifgen="~/.files_libs/gifgen.sh "
alias sshrc="~/.files_libs/sshrc.sh "
alias piShrink="~/.files_libs/piShrink.sh "
alias pishrink="piShrink"

# Gvn Alias
gvn() {
  ~/.files_libs/gvn.sh $@
}
alias gvnh="gvn help"
alias gvna="gvn add"
alias gvnr="gvn reset"
alias gvnp="gvn pull"
alias gvns="gvn status"
alias gvnc="gvn commit"
alias gvnl="gvn log"
alias gvnd="gvn diff"

# Aliases for local gh-md-toc
# https://github.com/ekalinin/github-markdown-toc
toc() {
  ~/.files_libs/github-markdown-toc/gh-md-toc $@
}
alias table='toc'
alias tableofcontents='toc'
alias readmetable='toc'
alias gh-md-toc='toc'
alias github-markdown-toc='toc'
