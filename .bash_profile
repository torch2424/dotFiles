# Simply Source our agnostice .bashrc
source ~/.bashrc

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi

export PATH="$HOME/.cargo/bin:$PATH"
