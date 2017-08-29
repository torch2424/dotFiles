#/bin/bash

#function to print mosh install usage
printmoshinstallusage() {
  echo "This install script will only work on Ubuntu, Debian, and OSX"
  echo "Brew for osx"
  echo "apt-get for ubuntu / debian"
}

if [ "$(uname)" == "Darwin" ] && [ -x "$(command -v brew)" ]; then
    brew install mobile-shell
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ] && [ -x "$(command -v apt-get)" ]; then 
    sudo apt-get install -y mosh
else
    echo "This install script will only work on Ubuntu, Debian, and OSX"
    echo "Brew required for osx"
    echo "apt-get required for ubuntu / debian"
fi
