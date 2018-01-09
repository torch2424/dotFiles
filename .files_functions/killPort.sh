#/bin/bash

function __killPort() {
if [ "$#" -ne 1 ]; then
    echo "Usage (Requires sudo): ./killPort.sh [port number]"
else
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sudo lsof -nti:$1 | xargs kill -9
    else
        sudo fuser -k $1/tcp
    fi
fi
}

alias killPort='__killPort'
alias killport='killPort'
alias kill-port='killport'
