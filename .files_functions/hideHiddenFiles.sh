#!/bin/bash

# Fucntion to show hidden files on OSX

__hideHiddenFiles() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder
}

alias hideHiddenFiles='__hideHiddenFiles'
alias hidehiddenfiles='hideHiddenFiles'
alias hide-hidden-files="hideHiddenFiles"
