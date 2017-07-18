#/bin/bash

ampprecommit() {
    gulp lint
    gulp check-types
    # gulp presubmit
}

alias amp-pre-commit='ampprecommit'
alias amppresubmit='ampprecommit'
