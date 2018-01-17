#/bin/bash

# Simply a command to run for dotfiles to be copied to the home directory
cp -r .* ~

# Go back home and delete the dot file repo
cd ~
rm -rf dotFiles
