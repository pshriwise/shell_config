#!/bin/zsh

# Killer: share history between multiple shells
setopt SHARE_HISTORY
#
# # If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS
#
# # Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

source $HOME/.zsh_config/zsh_perso
source $HOME/.zsh_config/zsh_alias
source $HOME/.zsh_config/.commonrc
source $HOME/.zsh_config/zsh_ohmzsh

export PYTHONPATH=/home/shriwise/.local/lib/python2.7/site-packages/:/home/shriwise/opt/slackbot/:/opt/Trelis-16.0/bin/:/home/shriwise/.local/bin/
export COWPATH=/home/shriwise/.bash/:/usr/share/cowsay/cows/
