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
#export HISTSIZE=10000
# ignore commands that lead with a space, ignore dups
export HISTCONTROL=ignoreboth,ignoredups
shopt -s histappend

#ignore some files for tab completion
export FIGNORE=$FIGNORE:.hi:.pyc:.o:.beam:.dSYM:.un~

export LESSCHARSET="utf-8"

# update the locate database
alias updatedb="sudo /usr/libexec/locate.updatedb"

alias ls="ls -G"
alias ll="ls -lah"
alias less="less -MNR"
alias http="http --style perldoc"
#export GREP_OPTIONS='--color=auto -n -i'
#alias composer="/usr/bin/php /usr/local/bin/composer"
export COMPOSER_DISABLE_XDEBUG_WARN=1

