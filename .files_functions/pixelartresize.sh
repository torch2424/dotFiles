#!/usr/bin/env bash

# Function to resize pixel with pint filter, to not lose any quality at any size
function pixelartupscale() {
  if [ "$#" -ne 2 ]; then
    echo "USAGE:"
    echo "./pixelartresize [file to be resized] [new width of file (can only be scaled by aspect ratio)]"
    echo " "
    echo "Note: This will edit the file in place"
  else
    mogrify -resize $2x -filter point -quality 100 "$1"
  fi
}

alias pixelartresize='pixelartupscale'
