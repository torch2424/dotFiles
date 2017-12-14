#!/bin/bash

# First define our changelist name
GVN_CHANGELIST="gvn-changelist"

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
  echo "gvn add [FILE_PATH]"
  echo "Add a file to be committed later"
  echo "Compare to: git add [FILE]"
  echo " "
  echo "gvn reset [FILE_PATH]"
  echo "Remove a file from being committed later"
  echo "Compare to: git reset [FILE]"
  echo " "
  echo "gvn commit [Commit message in quotes]"
  echo "commit local changes to repo"
  echo "Compare to: git commit -m [Commit message] && git push origin HEAD"
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
    # git add -> svn changelist my-changelist [File here]
    svn add --force "$2"
    svn changelist "$GVN_CHANGELIST" "$2"
  elif [ "$1" == "reset" ]; then
    # git reset -> svn changelist --remove [File here]
    svn changelist --remove "$2"
  elif [ "$1" == "status" ]; then
    # git status -> svn status
    # Doing both info and stuts, because git will show you current branch and stuff
    svn info
    echo " "
    echo "SVN Status:"
    echo " "
    svn status | grep -v gvn
    echo " "
    echo "GVN Changes to be committed:"
    echo "    (use \"gvn reset <file>\" to unstage)"
    svn st --changelist "$GVN_CHANGELIST" | grep -v Changelist | cut -b 3-
    echo " "
  elif [ "$1" == "checkout" ]; then
    # git checkout file -> svn checkout file
    echo "This is checkout for files..."
    svn revert "$2"
  elif [ "$1" == "commit" ]; then

    if [ "$#" -eq 2 ]; then
    # git add $1 && git commit -m "$2" && git push origin HEAD -> svn commit $2 -m "$3"
    # After &&, # Remove all files from changelist, but keep changelist
    echo "Commiting changelist..."
    svn commit --changelist "$GVN_CHANGELIST" --keep-changelists -m "$2" && \
    svn changelist --remove --recursive --cl "$GVN_CHANGELIST" . | grep -v D
    else
      echo "Must enter a commit message to commit the current changelist."
    fi
  elif [ "$1" == "log" ]; then
    # git log -n 10 -> svn log -v -l10
    svn log -l 5 -r PREV:HEAD
  elif [ "$1" == "diff" ]; then
    # git diff [FILE]. If git supports single file diffing?
    echo "Using Vim For colorful diffs"
    svn diff -r HEAD "$2" | vim -R -
  else
    echo "Command $1 is not suported. Type [gvn help] for info/help/usage and tips!"
  fi
}

# Some gvn aliases
alias gvnh="gvn help"
alias gvna="gvn add"
alias gvnr="gvn reset"
alias gvnp="gvn pull"
alias gvns="gvn status"
alias gvnc="gvn commit"
alias gvnl="gvn log"
alias gvnd="gvn diff"
