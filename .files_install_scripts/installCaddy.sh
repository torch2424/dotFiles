#!/bin/bash

# Script to install and build my custom fork of caddy at:
# https://github.com/torch2424/caddy
# Please see my reason for doing this at:
# https://github.com/torch2424/dotFiles/issues/12


# Slightly Go version parser
# https://gist.github.com/pyk/ab63cfbd53668c3eed50
function go_version {
  version=$(go version)
  regex="([0-9][0-9]?.[0-9][0-9]?.[0-9][0-9]?)"
  if [[ $version =~ $regex ]]; then 
    echo ${BASH_REMATCH[1]}
  fi
}

# Check go to be installed
go version > /dev/null
if [ $? -eq 0 ]; then
    # https://stackoverflow.com/questions/30874579/bash-comparison-of-version-strings-with-2-dots
    GO_VERSION="$(echo $(go_version) | sed 's/\.//g')"
    MIN_VERSION="$(echo "1.8.0" | sed 's/\.//g')"

    echo " "
    echo " "
    echo "Current Go Version: $GO_VERSION"
    echo "Min Go Version: $MIN_VERSION"
    echo " "
    echo " " 
  
    # Compare our versions
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

      # Copy to our go path bin
      cp caddy "$GOPATH/bin"

      echo "Build Complete! Please check \$GOPATH/src/github.com/torch2424/caddy/caddy"
      echo "For Instance:"
      echo " "
      echo "'cd \$GOPATH/src/github.com/torch2424/caddy/caddy'"
      echo "'./caddy'"
      echo " "
      echo "Copied to the binary to: $GOPATH/bin"
      echo "However, you may now copy this binary wherever you would like..."		
    else
      echo "Caddy requires Go 1.8 to be installed."
    fi
else
    echo "Caddy requires Go 1.8 to be installed."
fi
