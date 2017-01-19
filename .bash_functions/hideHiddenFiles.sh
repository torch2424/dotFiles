#!/bin/bash

# Fucntion to show hidden files on OSX

hideHiddenFiles() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder
}

alias hide-hidden-files="hideHiddenFiles"
