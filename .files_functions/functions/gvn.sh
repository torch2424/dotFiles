#!/bin/bash

function printgvninfo() {
  echo " "
  echo ",---..    ,,---."
  echo "|   | \  / |   |"
  echo "\`---|  \`'  \`   '"
  echo "\`---'           "
  echo "alpha v1.0"
  echo " "
  echo "Help:"
  echo " "
  echo "gvn is a simple wrapper around svn to seem more git-like. Not everything will be implemented. But here's a quick primer:"
  echo " "
  echo "This is coming from someone who is just barely learning svn. But from my understanding: svn is a centralized version control system, while git is decentralized. Git is more easily imagined as a tree, while svn is represents more of a file structure. Most operations on git and svn are the same, but some key gotchas:"
  echo " "
  echo "1. svn commiting goes straight to the server. There are no local commits in svn compared to git."
  echo " "
  echo "2. svn workflow can vary greatly from github. In git it is usually encouraged to branch everything, as merging is not a headache once you understand it. Master is supposed to be an always working build, and feature branches are reviewed before being pulled in. However, rumor is, merging is kind of a pain in svn, because its master branch, called trunk, is a centralized source of truth, and will often times not like what you are brining in. So svn workflows can follow the standard git style. Or follow a wild wild west trunk that everyone just commits to, and makes branches when there is a well tested point in time, or revision, for release."
  echo " "
  echo "MAJOR TODO:"
  echo "1. Add support for branching"
  echo " "
  echo "Commands:"
  echo " "
  echo "gvn clone [URL of repository]"
  echo "checkout the svn repository"
  echo "Compare to: git clone"
  echo " "
  echo "gvn pull"
  echo "update the svn repository"
  echo "Compare to: git pull"
  echo " "
  echo "gvn status"
  echo "shows svn repo info, and the current working changes (status)"
  echo "Compare to: git status"
  echo " "
  echo "gvn checkout [FILE_PATH]"
  echo "Checkout local changes to a file"
  echo "Compare to: git checkout [FILE]"
  echo " "
  echo "gvn commit [FILE] [Commit message in quotes]"
  echo "commit local changes to repo"
  echo "Compare to: git add [FILE] && git commit -m [Commit message] && git push origin HEAD"
  echo " "
  echo "gvn log"
  echo "Show latest 10 log changes to repository"
  echo "Compare to: git log -n 10"
  echo " "
  echo "gvn diff [FILE]"
  echo "Show diff between file and server. Only supports a single file however"
  echo "Compare to: git diff"
  echo " "
  echo "Don't see what you are looking for?"
  echo "Try: https://github.com/garethrees/git-to-svn-guide/blob/master/README.md"
}

# CLI For git users to do svn stuff
# USing this and learning repo as practice: https://github.com/garethrees/git-to-svn-guide/blob/master/README.md
function gvn() {

  if [ "$#" -lt 1 ]; then
    printgvninfo
  elif [ "$1" == "help" ]; then
    printgvninfo
  elif [ "$1" == "clone" ]; then
    # Git clone -> svn checkout
    svn checkout "$2"
  elif [ "$1" == "pull" ]; then
    # git pull -> svn update
    svn update
  elif [ "$1" == "add" ]; then
    # git add -> svn add
    svn add "$2"
  elif [ "$1" == "status" ]; then
    # git status -> svn status
    # Doing both info and stuts, because git will show you current branch and stuff
    svn info
    svn status
  elif [ "$1" == "checkout" ]; then
    # git checkout file -> svn checkout file
    echo "This is checkout for files..."
    svn revert "$2"
  elif [ "$1" == "commit" ]; then
    # git add $1 && git commit -m "$2" && git push origin HEAD -> svn commit $2 -m "$3"
    svn commit "$2" -m "$3"
  elif [ "$1" == "log" ]; then
    # git log -n 10 -> svn log -v -l10
    svn log -v -l10
  elif [ "$1" == "diff" ]; then
    # git diff [FILE]. If git supports single file diffing?
    svn diff "$2"
  else
    echo "Command $1 is not suported. Type [gvn help] for info/help/usage and tips!"
  fi
}

# Some gvn aliases
alias gvna="gvn add"
alias gvnp="gvn pull"
alias gvns="gvn status"
alias gvnc="gvn commit"
