#/bin/bash

resizeVideo() {

if [ "$#" -ne 2 ]; then
    echo "shortcut for: https://trac.ffmpeg.org/wiki/Scaling%20(resizing)%20with%20ffmpeg"
    echo "USAGE:"
    echo "resizeVideo.sh [inputfile] [width to resize/scale to]"
else
    ffmpeg -i $1 -vf scale=$2:-1 "$2_$1"
fi

}

alias resizevideo="resizeVideo"
alias scaleVideo="resizeVideo"
alias scalevideo="resizeVideo"
