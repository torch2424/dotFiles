# https://github.com/jez/vim-as-an-ide/commit/dcc0c8d

echo "Installing Vundle..."

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Run the plugin install
# https://github.com/VundleVim/Vundle.vim/wiki/Tips-and-Tricks
vim -c VundleUpdate -c quitall

echo "Done!"
