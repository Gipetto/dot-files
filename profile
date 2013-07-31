#! /bin/bash

# figure out our current location
DOT_FILES_DIR="$( dirname "$BASH_SOURCE[0]" )"

. "$DOT_FILES_DIR/bash_completion"
. "$DOT_FILES_DIR/bash_prompt"

# Add included bin directory to the path
export PATH="$PATH:$DOT_FILES_DIR/bin"

export EDITOR="vim"
export SVN_EDITOR="$EDITOR"

# longer history
export HISTSIZE=10000
# ignore commands that lead with a space, ignore dups
export HISTCONTROL=ignoreboth,ignoredups
shopt -s histappend

#ignore some files for tab completion
export FIGNORE=$FIGNORE:.hi:.pyc:.o:.beam:.dSYM:.un~

export LESSCHARSET="utf-8"

# update the locate database
alias updatedb="sudo /usr/libexec/locate.updatedb"

# flush the local dns cache
alias flushdns="dscacheutil -flushcache"

alias ls="ls -G"
alias ll="ls -lah"
alias less="less -MNR"
export GREP_OPTIONS='--color=auto -n -i'

# change directories down by the number of the arg passed, ie: _cd 2
HAVE_CD=`type -t _cd`
if [[ -z $HAVE_CD ]]; then
	function _cd {
		if [ $1 ]; then NUM=$1; else NUM=1; fi
		for (( i=1; i<=$NUM; i++)); do cd ../; done
	}
fi

# update git repositories without leaving the current directory
# handy if your project is an amalgamation of different repos
HAVE_PULL=`type -t _pull`
if [[ -z $HAVE_PULL ]]; then
	function _pull {
		cd ~/Projects/repo-name && git pull && cd -
		# repeat as necessary...
	}
fi

dirsize() {
	sudo find . ! -name . -type d -prune -exec du -hs {} \;
}