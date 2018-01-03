#!/bin/bash

# Function to download a youtube video and convert to mp3
youtubemp3() {
	if [ $# -ne "2" ]; then
		echo "Youtube mp3. First argument url. Second argument, output path"
		return
	fi

	if hash ytdl 2>/dev/null; then
        	ytdl $1 > /tmp/$2
		ffmpeg -i /tmp/$2 -acodec libmp3lame -aq 4 $2
	else
        	echo "ytdl is not installed. run: npm install -g ytdl"
	fi
}

alias youtube-mp3="youtubemp3"
alias youtubeMp3="youtubemp3"
alias youtubetomp3="youtubemp3"
