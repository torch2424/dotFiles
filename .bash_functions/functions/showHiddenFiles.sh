#!/bin/bash

# Fucntion to show hidden files on OSX

showHiddenFiles() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder
}

# Aliases for this function
alias show-hidden-files="showHiddenFiles"
