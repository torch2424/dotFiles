#!/bin/bash

# Function to download a youtube video and convert to mp3
__youtubemp3() {
	if [ $# -ne "2" ]; then
		echo "Youtube Video to mp3"
		echo "Usage:"
		echo "./youtubemp3 [Youtube URL] [Output Path e.g './video.mp3']"
		return
	fi

	if hash ytdl 2>/dev/null; then
        	ytdl $1 > /tmp/$2
			ffmpeg -i /tmp/$2 -acodec libmp3lame -aq 4 $2
	else
        	echo "ytdl is not installed. run: npm install -g ytdl"
	fi
}

alias youtubemp3='__youtubemp3'
alias youtube-mp3="youtubemp3"
alias youtubeMp3="youtubemp3"
alias youtubetomp3="youtubemp3"
alias youtube2mp3="youtubemp3"