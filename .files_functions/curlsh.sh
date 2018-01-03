#!/bin/bash

# Script to curl a file into sh
curlsh() {
	bash <(curl -s $1)
}

# Declare aliases for the functions
alias curl-sh="curlsh"
alias curlSh="curlsh"
