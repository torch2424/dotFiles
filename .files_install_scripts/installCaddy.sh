#!/bin/bash

# Script to install and build my custom fork of caddy at:
# https://github.com/torch2424/caddy
# Please see my reason for doing this at:
# https://github.com/torch2424/dotFiles/issues/12

# Check go to be installed
go version > /dev/null
if [ $? -eq 0 ]; then
    # Check go version
    GO_VERSION_PARSED="$(go version | grep -Eo "(\d+\.)+\d+")"
    # https://stackoverflow.com/questions/30874579/bash-comparison-of-version-strings-with-2-dots
    GO_VERSION="$(echo $GO_VERSION_PARSED | sed 's/\.//g')"
    MIN_VERSION="$(echo "1.8.0" | sed 's/\.//g')"
    if [ "$GO_VERSION" -gt "$MIN_VERSION" ]; then

      # Install caddy from source
      # https://www.calhoun.io/building-caddy-server-from-source/
      echo " "
      echo "Getting 'github.com/torch2424/caddy' and 'github.com/caddyserver/builds' ..."
      echo " "
      cd $GOPATH/src
      go get -u github.com/torch2424/caddy
      go get -u github.com/caddyserver/builds

      echo " "
      echo "Building Caddy for current architecture (May need to check script if this part fails)..."
      echo " "
      cd $GOPATH/src/github.com/torch2424/caddy/caddy
      # May need to pass -goos= and -goarch=
      go run build.go

      echo "Build Complete! Please check \$GOPATH/src/github.com/torch2424/caddy/caddy"
      echo "For Instance:"
      echo " "
      echo "'cd \$GOPATH/src/github.com/torch2424/caddy/caddy'"
      echo "'./caddy'"
      echo " "
      echo "You may now copy this binary wherever you would like..."
    else
      echo "Caddy requires Go 1.8 to be installed."
    fi
else
    echo "Caddy requires Go 1.8 to be installed."
fi
