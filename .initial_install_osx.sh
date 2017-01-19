#!/bin/bash

# Initial install Script for torch2424 on OSx
# Will require some user input to get things going. just follow the prompts!

# With Help From: https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/

# Install Command Line tools (Xcode tools), will bring up a modal agreement
xcode-select --install

# Run the ruby brew install script
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Initialize brew
brew doctor
brew update

# Install some apps using brew
brew install neofetch
brew install sshrc
