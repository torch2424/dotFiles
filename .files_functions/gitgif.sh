#/bin/bash


__gitgif() {
  if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "This will make a best guess to convert a video into a github friendly .gif"
    echo "Works best on videos ~30s"
    echo " "
    echo " "
    echo "USAGE:"
    echo " "
    echo "    gitgif [video file e.g (example.mp4)] [Optional: width of new video to scale to e.g 320]"
  elif ! type "ffmpeg" > /dev/null 2>&1; then
    echo "ffmpeg and gifgen are required for $0"
    echo "OSX: brew install gifgen"
    echo "OSX: brew install ffmpeg"
    echo "Ubuntu: https://github.com/lukechilds/gifgen"
    echo "Ubuntu: sudo apt-get install ffmpeg"
  elif ! type "gifgen" > /dev/null 2>&1; then
    echo "ffmpeg and gifgen are required for $0"
    echo "OSX: brew install gifgen"
    echo "OSX: brew install ffmpeg"
    echo "Ubuntu: https://github.com/lukechilds/gifgen"
    echo "Ubuntu: sudo apt-get install ffmpeg"
  else

    # Get the dimensions of the video
    eval $(ffprobe -v error -of flat=s=_ -select_streams v:0 -show_entries stream=height,width $1)
    WIDTH=${streams_stream_0_width}

    # Define our temporary gif path
    TEMP="/tmp/gitgif.gif"

    # Resize the video to about 500
    BASEWIDTH=500
    # Check if we passed a width
    if [ -z $2 ]; then
      BASEWIDTH=500
    else
      BASEWIDTH=$2
    fi

    if [ $WIDTH -gt $BASEWIDTH ]; then
      # Allow CTRL C
      trap "exit" INT
      until ffmpeg -y -i $1 -r 30 -vf scale=$BASEWIDTH:-1 $TEMP
      do
        # Allow CTRL C
        sl -e
        # Down size the base width as it must not be an even number
        BASEWIDTH=$((BASEWIDTH - 1))
      done
    else
      cp $1 $TEMP
    fi

    # Get the filename
    FILENAME=$(basename $1)
    FILENAME="${FILENAME%.*}"

    # Install gifgen:
    # https://github.com/lukechilds/gifgen
    # Generate the gif
    gifgen -o "$FILENAME.gif" $TEMP
  fi
}

alias gg='__gitgif'
alias gitgif='gg'
alias githubgif='gg'
alias preetypr='gg'
alias gif='gg'
