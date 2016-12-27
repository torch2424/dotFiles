#!/usr/bin/env bash

#inspired by: http://superuser.com/questions/503784/loading-local-shell-aliases-to-ssh-session-dynamicaly
dotssh() {
	# First concatenate our aliases and cuntions into one file
	cat /home/$(whoami)/.bash_aliases > .bashrc_remote
	for f in /home/$(whoami)/.bash_functions/*; do cat .bashrc_remote $f > .bashrc_remote; done
	# send the file over ssh
	ssh $@ "cat > /tmp/.bashrc_temp" < .bashrc_remote
	ssh -t $@ "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"	
	#remove the temp bashrc
	rm .bashrc_remote
}
