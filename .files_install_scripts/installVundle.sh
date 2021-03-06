# https://github.com/jez/vim-as-an-ide/commit/dcc0c8d

echo "Installing vim & neovim..."
if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform

  # Vim instlled by default
  # echo "vim already installed"

  # Install neovim
  brew install neovim
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform
  sudo apt update
  sudo apt install -y vim vim-gui-common neovim
fi

echo "Installing fzf..."
if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform

  brew install fzf
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform

  sudo apt install fzf
fi


echo "Installing Vundle..."

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Run the plugin install
# https://github.com/VundleVim/Vundle.vim/wiki/Tips-and-Tricks
vim -c VundleUpdate -c quitall

# nerdtree broke clicking a file to open it in 6.10.5, so we need to manually switch to this release
# As in my experience, it was not fixed completely.
# See: https://github.com/preservim/nerdtree/issues/1224
# See: https://github.com/preservim/nerdtree/pull/1225
(cd ~/.vim/bundle/nerdtree && git checkout 6.10.4)

echo "Done!"
