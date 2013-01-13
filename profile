#! /bin/bash

# figure out our current location
DOT_FILES_DIR="$( dirname "$BASH_SOURCE[0]" )"

. "$DOT_FILES_DIR/bash_completion"
. "$DOT_FILES_DIR/bash_prompt"

# longer history
export HISTSIZE=10000
# ignore commands that lead with a space, ignore dups
export HISTCONTROL=ignoreboth,ignoredups
shopt -s histappend

#ignore some files for tab completion
export FIGNORE=$FIGNORE:.hi:.pyc:.o:.beam:.dSYM:.un~

# update the locate database
alias updatedb="sudo /usr/libexec/locate.updatedb"

# flush the local dns cache
alias flushdns="dscacheutil -flushcache"

# open man pages in Preview
function manp() {
	man -t $1 | open -f -a /Applications/Preview.app
}

alias ls="ls -G"
alias ll="ls -lah"
alias less="less -MNR"
export GREP_OPTIONS='--color=auto -n -i'

# run sass with the cache location in /tmp to avoid turds
alias sassy="sass --unix-newlines --cache-location=/tmp/scss"

# diff the current project and open the diff in TextMate
alias _diff="git diff | mate"

# pretty log tailing
alias trimlog="perl -pe 's/\[error\]\s+\[client.*?\]\s+//; s/, referer:.*//'";
alias taillog="sudo tail -n 50 -f /var/log/httpd/error_log | trimlog";

# change directories down by the number of the arg passed, ie: _cd 2
function _cd {
	if [ $1 ]; then NUM=$1; else NUM=1; fi
	for (( i=1; i<=$NUM; i++)); do cd ../; done
}

# update git repositories without leaving the current directory
# handy if your project is an amalgamation of different repos
function _pull {
	cd ~/Projects/repo-name && git pull && cd -
	# repeat as necessary...
}

# execute a curl command and pipe the response off to a JSON formatter
curlj() {
	curl $@ | python -mjson.tool
}

# remove a single line from a file
# handy for when you need to kill a line after an AWS host has changed
rmline() {
	if ! [ "$#" = "2" ]; then
		echo 'Invalid paramter count';
		echo 'Usage: rmline line-num filename'
		return;
	fi
	
	sed -i 0 "$1d" $2
}

_vnc() {
	if ! [ $1 ]; then
		echo 'No destination given';
		echo 'Usage: _vnc user@host.com'
		return;
	fi
	ssh -C -c blowfish -f -L 1202:localhost:5900 $1 sleep 10; open vnc://localhost:1202;
}

dirsize() {
	sudo find . ! -name . -type d -prune -exec du -hs {} \;
}