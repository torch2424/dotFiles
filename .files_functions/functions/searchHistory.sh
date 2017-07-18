#/bin/bash

searchHistory() {

    if (("$#" == 1)); then
        history | grep -on "$1.*"
    elif (("$#" == 0)); then
        history
    else
        echo "Please pass an argument"
    fi
}

alias searchhistory='searchHistory'
alias showHistory='searchHistory'
alias showhistory='showHistory'
alias historySearch='searchHistory'
alias search-history='searchHistory'
alias show-history='searchHistory'
