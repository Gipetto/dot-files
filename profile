#! /bin/bash

# figure out our current location
DOT_FILES_DIR="$( dirname "$BASH_SOURCE[0]" )"

. "$DOT_FILES_DIR/bash_completion"
. "$DOT_FILES_DIR/bash_prompt"

# z seems pretty cool github.com/rupa/z
. /usr/local/etc/profile.d/z.sh

# Add included bin directory to the path
export PATH="$PATH:$DOT_FILES_DIR/bin"

export EDITOR="vim"
#export SVN_EDITOR="$EDITOR"

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
#export GREP_OPTIONS='--color=auto -n -i'

## Print a horizontal rule
function rule () {
	printf "%$(tput cols)s\n" | tr " " "─"
}

# gussy up function for git diff alias (defined in git/gitconfig)
# modified from github.com/paulirish/dotfiles
function diff_cleanup_output() {
	local color_code_regex=$'(\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])'
	local newline=$'\x0A'
	local _rule=$(rule)

	# embellesh the unified patch diff header
	# leading rule
	sed -E "s/^($color_code_regex)(diff --git .*)$/\\1$_rule\\5/g" | \
	# trailing rule
	sed -E "s/^($color_code_regex)(\+\+\+.*)$/\1\5\\1\\$newline$_rule/"  | \
	# leading +/- indicators
	sed -E "s/^($color_code_regex)[\+\-]/\1 /g"
}