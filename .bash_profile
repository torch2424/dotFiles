# Simply Source our agnostice .bashrc
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi

export PATH="$HOME/.cargo/bin:$PATH"
