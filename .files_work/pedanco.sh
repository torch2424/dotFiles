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
# https://gist.github.com/shytikov/3132078
function pedanco_gc() {

	if [[ $(pwd) == *"pedanco"* ]] || [[ $(pwd) == *"wopr"* ]]; then

    if [ "$#" -eq 1 ]; then
  	    git commit -m "$1 --skip-ci"
  	else
  		echo " "
  		echo "pedanco_gc USAGE:"
  		echo " "
  		echo "pedanco_gc 'COMMIT_MESSAGE_IN_QUOTES'"
  		echo " "
  	    echo "Aborting commit due to empty commit message."
  	fi

  else
    git commit
	fi
}

alias gc='pedanco_gc'
alias gcnoskip='git commit'

source ~/.files_work/sourceEnvVariablesPedanco.sh