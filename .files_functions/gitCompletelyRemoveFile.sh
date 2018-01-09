#bin/bash

function __gitCompletelyRemoveFile() {
    echo "This will completely remove a file from repo by reqriting history"
    echo "https://stackoverflow.com/questions/16877530/completely-remove-a-file-from-whole-git-repository"
    echo "https://help.github.com/articles/removing-sensitive-data-from-a-repository/"

    echo "https://dalibornasevic.com/posts/2-permanently-remove-files-and-folders-from-git-repo"

    echo " "
    echo " "

    if [ "$#" -eq 1 ]; then

    git filter-branch --force --index-filter \
        "git rm --cached --ignore-unmatch $1" \
        HEAD

    else
        echo "You must pass in a file path e.g .files/hello.js"
    fi
}

alias gitcompletelyremovefile='__gitCompletelyRemoveFile'
alias gitCompletelyRemoveFile='__gitCompletelyRemoveFile'
alias gfb="__gitCompletelyRemoveFile"
alias gcrf="gfb"
