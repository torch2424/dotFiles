#/bin/bash


# Fucntion to execute a bash script starting at line number

__executefromline() {
  if [ "$#" -ne 2 ]; then
      echo "USAGE: executeFromLine.sh [script file] [line # to execute from]"
  else
      cat $1 | awk "NR>=$2" | bash
  fi
}

alias executefromline='__executefromline'
alias bashfromline='executefromline'
alias executebashfromline='executefromline'
alias scriptfromline='executefromline'
alias exectueatline='executefromline'
