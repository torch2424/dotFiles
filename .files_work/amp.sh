#!/bin/bash

# Google Amp productive funtions and aliases

# Ampe pre commit - useful stuff to run before commiting to ensure travis builds are going to work
ampprecommit() {
    gulp lint
    gulp check-types
    # gulp presubmit
}

alias amp-pre-commit='ampprecommit'
alias amppresubmit='ampprecommit'

# Function to simply run the passed test file with optimal flags
amptestfile() {
  gulp test --nobuild --watch --files=$1
}

alias amptest='amptestfile'
