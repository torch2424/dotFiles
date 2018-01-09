#/bin/bash

__searchHistory() {

    if (("$#" == 1)); then
        history | grep "$1.*"
    elif (("$#" == 0)); then
        history
    else
        echo "Please pass an argument"
    fi
}

alias searchhistory='__searchHistory'
alias showHistory='searchhistory'
alias showhistory='showHistory'
alias historySearch='searchhistory'
alias search-history='searchhistory'
alias show-history='searchhistory'
