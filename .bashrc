#!/usr/bin/env bash

# Function to check our enviornment for variables quietly
checkenv() {
  if env | grep -q $1 ; then
    # True in bash = 0
    return 0
  else
    # False in bash = 1
    return 1
  fi
}
env

# Check if we are scp or sftp by grepping our env
# Run all check env commands here
checkenv "USER" && checkenv "HOME"

# Check if the previous check env commands all returned 0 for true / success
if [ $? -ne 0 ] ; then
    # Do not allow sourcing the bashrc
    echo hello
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
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This l    oads nvm bash_completion

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

  # Set OSX Paths
  if [ "$(uname)" == "Darwin" ]; then
    # Java Path
    export JAVA_HOME=`/usr/libexec/java_home`
    # Android Path
    export ANDROID_PATH="/Users/aaron/Library/Android/sdk"
  fi

  # Clear the console
  # clear

  # Finally, load neo fetch if it is installed
  if hash neofetch 2>/dev/null; then
          neofetch
  fi
fi
