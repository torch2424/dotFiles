#/bin/bash

__gitSyncForkToMaster() {

    GIT_BRANCH=master

    if [ "$#" -ne 1  ] && [ "$#" -ne 2 ]; then
        echo "Must pass fork git clone url"
        echo "e.g  https://github.com/ampproject/amphtml.git"
        echo "Exiting..."
        return 1;
    fi

    # Remove the old upstream
    echo "Removing any old 'upstream' remote..."
    git remote rm upstream

    # Add the remote, call it "upstream":

    git remote add upstream $1

    # Fetch all the branches of that remote into remote-tracking branches,
    # such as upstream/master:

    git fetch upstream

    # Make sure that you're on your master branch:

    git checkout $2

    # Rewrite your master branch so that any commits of yours that
    # aren't already in upstream/master are replayed on top of that
    # other branch:

    git rebase upstream/$2

    # Force push to our master
    git push -f origin $2
}

# Alaises
alias gitSyncForkToMaster='__gitSyncForkToMaster'
alias gitSyncFork='gitSyncForkToMaster'
alias git-sync-fork='gitSyncFork'
alias gitforksync='gitSyncFork'
alias gitsyncfork='gitSyncFork'
