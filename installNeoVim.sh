#!/bin/bash

echo "Downloading nvim into this directory as nvim.appimage"

wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

chmod u+x nvim.appimage

mkdir -p ~/.config/nvim

cat <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT

echo "Now alias nvim and/or vim to nvim.appimage"

