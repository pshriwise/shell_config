#!/bin/bash

# infinite history
export HISTSIZE=
export HISTFILESIZE=
# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


### Include Git Aware Prompt ###
export GITAWAREPROMPT=~/.bash/bash/
source $GITAWAREPROMPT/prompt.sh

#keybinding addition
if [ "$TERM" == "xterm" ]; then
    bind '"\C-H":backward-kill-word'
fi

##############################
# IMPORT ALL COMMON SETTINGS #
##############################
source $HOME/.bash/commonrc
