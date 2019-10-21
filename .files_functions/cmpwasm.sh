#!/bin/bash

# Function to compare wasm binaries
# https://superuser.com/questions/125376/how-do-i-compare-binary-files-in-linux

__cmpWasm() {
  cmp -l $1 $2 | gawk '{printf "%08X %02X %02X\n", $1, strtonum(0$2), strtonum(0$3)}'
}

# Aliases for this function
alias cmpwasm='__cmpWasm'
alias cmp-wasm="cmpwasm"
