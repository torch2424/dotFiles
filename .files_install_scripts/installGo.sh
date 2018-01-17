#!/bin/bash

# Make sure we pass our version
if [ "$#" -ne 1 ]; then
    echo "Must pass the go version you would like to install"
	echo "Go Downloads page: https://golang.org/dl/"
    echo " "
    echo "USAGE: ./installGo.sh [Go version => \"1.8.1\"]"
else
 # Install Go
 GO_VERSION=$1

 GO_OS=""
if [ "$(uname)" == "Darwin" ]; then
   GO_OS="darwin-amd64"        
elif [ "$(dpkg --print-architecture)" == "armhf" ]; then
   GO_OS="linux-armv6l"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
   GO_OS="linux-amd64"
fi

 echo "Downloading go$GO_VERSION.$GO_OS.tar.gz"
 curl -O https://storage.googleapis.com/golang/go$GO_VERSION.$GO_OS.tar.gz
 echo 'Unpacking go language'
 sudo tar -C /usr/local -xzf go$GO_VERSION.$GO_OS.tar.gz
 sudo chown -R root:root /usr/local/go
 #Cleanup
 sudo rm go$GO_VERSION.$GO_OS.tar.gz

echo "Finished! Run the following code to set up your go paths in your bashrc if you have not already:"
echo '
 #Editing .bashrc
 BASHRC="~/.bashrc"
 echo "Setting up correct env. variables"
 echo "export GOROOT=/usr/local/go" >> $BASHRC
 echo "export GOPATH=~/goPath" >> $BASHRC
 echo "export PATH=\"$PATH:$GOROOT/bin:$GOPATH/bin\"" >> $BASHRC
 source $BASHRC

 #Create reuired go folders
 mkdir -p $GOPATH/{bin,pkg,src}
'
fi
