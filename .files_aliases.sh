#!/usr/bin/env bash

# Bash Aliases by: torch2424
# Repo: https://github.com/torch2424/dotFiles 

# Show our aliases
alias showalias="cat ~/.bash_aliases.sh"
alias showaliases="showalias"
alias showbashalias="showalias"
alias showbashalaises="showalias"
alias listalias="showalias"
alias listaliases="showalias"
alias lsalias="showalias"
alias lsaliases="showalias"

# Show our functions
alias showfunction='ls ~/.bash_functions/functions'
alias showfunctions='showfunction'

# Source our .bashrc again
alias re-source='source ~/.bashrc'
alias resource="re-source"
alias reSource="re-source"

# Install .debs with ease
alias install-deb="sudo dpkg -i "

# Default ls with colors
alias ls="ls -Gp"

# Default df with readable byte
alias df="df -h"

# Github Aliases
alias gs='git status '
alias gc='git commit'
alias ga='git add -A '
alias gp='git push origin HEAD '
alias guc='git reset HEAD~ '
alias gpo='git push origin '
alias gpom='git push origin master '
alias gpoh='git push origin HEAD '
alias gauc="git update-index --assume-unchanged "
alias guac="gauc"

# Vagrant Aliases
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant status'
alias vssh='vagrant ssh'
alias vd='vagrant destroy'

# cd aliases
alias cdvs='cd ~/vagrantBox/'
alias cds='cd ~/Source/'
alias cdg='cd ~/goPath/'
alias cdpico='cd ~/Library/Application\ Support/pico-8/carts/'
alias cdpico8='cdpico'

#Copy recursively with progress
alias copyprogress='rsync -avh --progress'
alias cpprogress='copyprogress'

# tmux aliasas
alias tmuxnew='tmux new -s'
alias tmuxkill='tmux kill-session -t'
alias tmuxrm='tmuxkill'
alias tmuxls='tmux ls'
alias tmuxattach='tmux attach -t'
alias tmuxattatch='tmuxattach'
alias tmuxjoin='tmuxattach'

# Show our current app ports
alias showports="sudo netstat -lptn"
alias showserver="showports"
alias showport="showports"
alias showservers="showports"

# Ios Simulator alias: http://stackoverflow.com/questions/10379622/how-to-run-iphone-emulator-without-starting-xcode
alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
alias iossimulator='simulator'
alias ios-simulator='simulator'

#Android SDK and simulator
#http://stackoverflow.com/questions/19238476/mac-terminal-how-to-start-android-virtual-device-manager-on-cli
alias androidsdk="bash ~/Library/Android/sdk/tools/android"
alias android-sdk="androidsdk"
alias androidavd="androidsdk avd"
alias android-avd="androidavd"

#Pico 8 from console
alias pico8="/Applications/PICO-8.app/Contents/MacOS/pico8"
alias pico-8="pico8"

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