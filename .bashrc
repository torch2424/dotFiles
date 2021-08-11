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

  # Load our bash function
  _source_all .files_functions

  # Load our active default work aliases and fucntions
  _user_source .files_work/default.sh

  # Load Our bash libraries
  _user_source .files_libs/index.sh

  # Completion for all of our aliases
  _user_source .files_completion.sh

  # Cache our Git credentials
  git config --global credential.helper 'cache --timeout=36000'

  # Set default editor
  export VISUAL=vim
  export EDITOR="$VISUAL"

  # Load NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Add support for globally installed Yarn Packages
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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
  # Add support for Go Modules
  export GO111MODULE=on
  #TinyGo
  export PATH=$PATH:/usr/local/tinygo/bin

  # Rust settings
  export PATH="$HOME/.cargo/bin:$PATH"

  # PyEnv Python Managment
  export PATH="/home/torch2424/.pyenv/bin:$PATH"
  # https://stackoverflow.com/a/677212
  if hash pyenv 2>/dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi

  # Wasmer
  export WASMER_DIR="$HOME/.wasmer"
  [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer

  # Fastly / Lucet
  export PATH="/opt/lucet/bin:${PATH}"
  export LD_LIBRARY_PATH="/opt/lucet/lib:${LD_LIBRARY_PATH}"
  export DYLD_LIBRARY_PATH="/opt/lucet/lib:${DYLD_LIBRARY_PATH}"
  #if [ $# -gt 0 ]; then
  #    exec "$@"
  #fi
  export PATH="$HOME/ecp-js:$PATH"

  # Wasmtime
  export WASMTIME_HOME="$HOME/.wasmtime"
  export PATH="$WASMTIME_HOME/bin:$PATH"

  # Google CLoud SDK
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/home/torch2424/google-cloud-sdk/path.bash.inc' ]; then . '/home/torch2424/google-cloud-sdk/path.bash.inc'; fi
  # The next line enables shell command completion for gcloud.
  if [ -f '/home/torch2424/google-cloud-sdk/completion.bash.inc' ]; then . '/home/torch2424/google-cloud-sdk/completion.bash.inc'; fi

  # GBDK
  export PATH="/opt/gbdk/bin:$PATH"

  # gifgen
  export PATH="$HOME/gifgen/gifgen:$PATH"

  # Wasienv
  export WASIENV_DIR="$HOME/.wasienv"
  [ -s "$WASIENV_DIR/wasienv.sh" ] && source "$WASIENV_DIR/wasienv.sh"

  # Wabt
  export PATH="$HOME/wabt/bin:$PATH"

   # Set OSX Development Paths
  if [ "$(uname)" == "Darwin" ]; then
    # Java Path
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    # Android Path
    export ANDROID_PATH="/Users/aaron/Library/Android/sdk"
    export PATH="/Applications/VLC.app/Contents/MacOS/VLC:$PATH"

    # LLVM / Wasm Settings
    # https://00f.net/2019/04/07/compiling-to-webassembly-with-llvm-and-clang/
    export PATH="/usr/local/opt/llvm/bin:$PATH"
  fi

  # Set Linux Development Paths
  if [ "$(uname)" == "Linux" ]; then
    export LLVM_BIN="/usr/lib/llvm-*/bin"

    # Kitty terminal
    export PATH="$HOME/.local/bin/:$PATH"

    # Fzf
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  fi

  # Clear the console
  # This will cause "TERM environment variable not set" error
  # https://stackoverflow.com/questions/16242025/term-environment-variable-not-set#comment78763554_33679937
  # clear

  # Load our bash theme, if we are in an interactive shell
  if [[ $- == *i* ]]; then
    _source_all .files_libs/sexy_prompt

    # Load a Demo friendly Bash theme
    # https://ezprompt.net/
    # export PS1="\[\e[36m\]demouser\[\e[m\] in \[\e[35m\]\w\[\e[m\] \\$ "

    # return
  fi

  # Finally, load neo fetch if it is installed
  if hash neofetch 2>/dev/null; then
    neofetch
    # return
  else
  	echo " "
  	echo "To be really cool, install neofetch: https://github.com/dylanaraps/neofetch"
  	echo " "
  fi
fi

