#/bin/bash

# Function to simply run the passed test file with optimal flags
amptestfile() {
  gulp test --nobuild --watch --files=$1
}

alias amptest='amptestfile'
