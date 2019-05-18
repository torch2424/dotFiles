#/bin/bash

# https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/

setupSshKeys() {

  if [ "$#" -lt 3 ] || [ "$#" -gt 3 ]; then
    echo "setupSshKeys USAGE:"
    echo "setupSshKeys [username] [url] [port]"
  else
    
    echo " "
    echo "Will have to login for $1@$2 multiple times :)"
    echo " "

    echo "--- LOCAL SERVER ---"
    echo " "

    echo "Generating passwordless keys if none..."
    SSH_FILE=/home/$(whoami)/.ssh/id_rsa
    if test -f "$SSH_FILE"; then
      echo "$SSH_FILE was found, skipping generation..."
    else
      echo "$SSH_FILE was NOT found, generating..."
      ssh-keygen -f $SSH_FILE -t rsa -N ''
    fi

    echo " "
    echo "--- REMOTE SERVER ---"
    echo " "


    echo "Creating .ssh directory if none"
    ssh -p $3 $1@$2 mkdir -p .ssh

    echo "Appending ssh key to authorized keys..."
    cat /home/$(whoami)/.ssh/id_rsa.pub | ssh -p $3 $1@$2 'cat >> .ssh/authorized_keys'

    echo "Setting .ssh permissions..."
    ssh -p $3 $1@$2 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"

    echo " "
    echo "Done!"
    echo "Please try to SSh now:"
    echo "$1@$2"
    echo " "
  fi
}

alias setupsshkeys='setupSshKeys'
alias setup-ssh-keys='setupsshkeys'
