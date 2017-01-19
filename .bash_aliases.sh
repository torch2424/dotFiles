#!/usr/bin/env bash

# Bash Aliases by: torch2424
# Repo: https://github.com/torch2424/dotFiles 

# Source our .bashrc again
alias re-source='source ~/.bashrc'

# Install .debs with ease
alias install-deb="sudo dpkg -i "

# Default ls with colors
alias ls="ls -Gp"

# Github Aliases
alias gs='git status '
alias gc='git commit'
alias ga='git add -A '
alias gp='git push origin HEAD '
alias guc='git reset HEAD~ '
alias gpo='git push origin '
alias gpom='git push origin master '
alias gpoh='git push origin HEAD '

# Vagrant Aliases
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant status'
alias vssh='vagrant ssh'
alias vd='vagrant destroy'

# cd aliases
alias cdv='cd ~/vagrantBox/'
alias cds='cd ~/vagrantBox/source/'
alias cdg='cd ~/vagrantBox/goPath/'

# Cool speedtest alias, works by using wget
# (Which shows speed in kilobytes per second
# or Megabytes per second)
# And tries to download an ubuntu iso
# (Which has no affiliation to isps)
# to a directory that auto deletes itself
alias speedtest='wget -O/dev/null https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip'

# Alias to scan wifi for things like raspberry pi's
alias scanwifi='nmap -sP 192.168.1.0/24'
alias scanwifi-onhub='nmap -sP 192.168.86.0/24'

# Screen record 24fps seconds of x
# -r  Frames per second
# -i is the x display
# -s is video size (Make this bigger if only recording terminal or something. Starts from upper left corner of display)
alias screenrecord='ffmpeg -f x11grab -s 1280x720 -r 30 -i :0 screenrecord.avi'
