#!/usr/bin/env bash

# Function to check our enviornment for variables quietly
# Usage: checkenv [ENV_VARIABLE_TO_CHECK] [0 for it exists, 1 for it does not]
checkenv() {
  if env | grep -q $1 ; then
    # True in bash = 0
    if [ $2 -eq 0 ]; then
      return 0
    else
      return 1
    fi
  else
    # False in bash = 1
    if [ $2 -eq 0 ]; then
      return 1
    else
      return 0
    fi
  fi
}

# Command to check the current env
# env | tr '\n' ' \\\ '

# Check if we are scp or sftp by grepping our env
# SCP will have an ssh client, but not SSH TTY
# Run all check env commands here
checkenv "SSH_CLIENT" 0 && checkenv "SSH_TTY" 1

# Check if the previous check env commands all returned 0 for true / success
if [ $? -eq 0 ] ; then
    # Do not allow sourcing the bashrc
    return
else
  # Fucntion to source from the user home directory
  _user_source() {
  	source ~/$1
  }

  # Function to source all files in folder
  _source_all() {
  	 for f in ~/$1/*.sh; do source $f; done;
  }

  # load our bash aliases
  _user_source .files_aliases.sh

  # load our bash function
  _source_all .files_functions

  # Load Our bash libraries
  _user_source .files_libs/index.sh

  # Cache our Git credentials
  git config --global credential.helper 'cache --timeout=36000'

  # Set Vim as default editor
  export VISUAL=vim
  export EDITOR="$VISUAL"

  # Load NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Npm no Sudo
  export NPM_PACKAGES="~/.npm-packages"
  export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
  export PATH="$NPM_PACKAGES/bin:$PATH"
  # Unset manpath so we can inherit from /etc/manpath via the `manpath`
  # command
  unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
  export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

  # Go Settings
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/goPath
  # Go bin Global
  export PATH="$PATH:$GOPATH/bin"

  # Ruby
  # Load RVM into a shell session *as a function*
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"

   # Elastic search for pedanco
   export ES_HOME=~/elasticsearch-1.7.5
   alias elasticsearch='~/elasticsearch-1.7.5/bin/elasticsearch'
   
   # Pedanco Postgres
   export PATH=$PATH:/usr/local/bin/postgres
  
   # Pendanco Aliases
  alias woprengine='WORKERS=ConversationEventWorker rake sneakers:run'
  
   # Set OSX Paths
  if [ "$(uname)" == "Darwin" ]; then
    # Java Path
    export JAVA_HOME=`/usr/libexec/java_home`
    # Android Path
    export ANDROID_PATH="/Users/aaron/Library/Android/sdk"
  fi

  # Clear the console
  clear

  # Finally, load neo fetch if it is installed
  if hash neofetch 2>/dev/null; then
          neofetch
  fi
fi
