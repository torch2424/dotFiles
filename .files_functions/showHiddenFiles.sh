#!/bin/bash

# Fucntion to show hidden files on OSX

__showHiddenFiles() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder
}

# Aliases for this function
alias showHiddenFiles='__showHiddenFiles'
alias show-hidden-files="showHiddenFiles"
