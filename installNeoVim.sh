#!/bin/bash

echo "Downloading nvim into this directory as nvim.appimage"

wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

chmod u+x nvim.appimage

mkdir -p ~/.config/nvim

echo "Setting nvim to use standard vim .vimrc"

cat <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT

echo "Installing pynvim extensions for cool addon support!"
pip3 install --user pynvim

echo "Now alias nvim and/or vim to nvim.appimage"

