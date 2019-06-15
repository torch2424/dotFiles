#!/bin/bash

# Google Amp productive funtions and aliases

# See: https://github.com/ampproject/amphtml/blob/master/contributing/TESTING.md#testing-commands

# Fix Java
# https://github.com/ampproject/amphtml/issues/11574
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Ampe pre commit - useful stuff to run before commiting to ensure travis builds are going to work
ampprecommit() {
    gulp lint --local-changes
    gulp check-types --local-changes
    gulp test --local-changes
    # gulp presubmit
}

alias amp-pre-commit='ampprecommit'
alias amppresubmit='ampprecommit'

# Function to simply run the passed test file with optimal flags
amptestfile() {
  gulp test --watch --files=$1
}

amptestlocalchanges() {
  gulp test --local-changes --watch
}

ampserveexample() {
  gulp --extensions_from=$1 --with_inabox
}

ampvisualdiff() {

  if [ $# -eq 0 ]; then
    echo "Must pass regex for tests you want to run."
    return
  fi
  
  echo " "
  echo "Don't forget to run 'gulp build --fortesting' before running visual diffs on clean project."
  echo " "
  echo "Don't forget to add PERCY_TOKEN in .files_work/.env"
  echo " "

  source ~/.files_work/.env

  echo "Using PERCY_TOKEN: $PERCY_TOKEN"

  sleep 1s

  gulp visual-diff --nobuild --percy_project ampproject/torch2424 --percy_token $PERCY_TOKEN --percy_branch master --grep $1
}

alias amptest='amptestfile'

# Use our 'gitsyncfork' alias but for amphtml master
alias gitsyncforkamp='gitsyncfork https://github.com/ampproject/amphtml.git'

alias ampvisual='ampvisualdiff'
alias amppercy='ampvisual'
