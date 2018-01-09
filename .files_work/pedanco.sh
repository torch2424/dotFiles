#!/bin/bash

# Aliases and things for pedanco

# Pedanco Postgres
 export PATH=$PATH:/usr/local/bin/postgres

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

 # Load RVM into a shell session *as a function*
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

 # Pendanco Aliases
alias woprengine='WORKERS=ConversationEventWorker rake sneakers:run'


# Skip CI for pedanco
alias gpoh='git push origin HEAD --skip-ci'
alias gpom='gpoh'