#!/bin/bash

# Script to curl a file into sh
__curlsh() {
	bash <(curl -s $1)
}

# Declare aliases for the functions
alias curlsh='__curlsh'
alias curl-sh="curlsh"
alias curlSh="curlsh"
