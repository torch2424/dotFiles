#!/bin/bash

# Simply Prefer remote gvn over local and import

# Import of gvn.sh
# Following pattern similar to: https://github.com/torch2424/bebop.sh
GVN_PATH="$HOME/.files_libs/gvn/gvn.local.sh"; GVN_URL="https://raw.githubusercontent.com/torch2424/gvn/master/gvn.sh"; if curl -o /dev/null -sIf "$GVN_URL"; then curl -s "$GVN_URL" -o /tmp/gvn.sh; chmod +x /tmp/gvn.sh; bash /tmp/gvn.sh "$@"; elif [ -f "$GVN_PATH" ]; then bash "$GVN_PATH" "$@"; else echo "Could not load gvn from $GVN_PATH or $GVN_URL. Please check your gvn path and internet connection. Halting execution of the script..."; exit 1; fi;
