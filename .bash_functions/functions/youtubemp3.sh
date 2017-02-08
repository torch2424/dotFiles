#!/bin/bash

# Function to download a youtube video and convert to mp3
youtube-mp3() {
	if [ $# -ne "2" ]; then
		echo "Youtube mp3. First argument url. Second argument, output path"
		return
	fi

	if hash ytdl 2>/dev/null; then
		rm /tmp/youtbemp3.webm
        	ytdl $1 > /tmp/youtubemp3.webm
		ffmpeg -i /tmp/youtubemp3.webm -acodec libmp3lame -aq 4 $2
	else
        	echo "ytdl is not installed. run: npm install -g ytdl"
	fi
}

alias youtubemp3="youtube-mp3"
