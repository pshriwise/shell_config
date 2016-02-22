#!/bin/zsh

# Killer: share history between multiple shells
 setopt SHARE_HISTORY
#
# # If I type cd and then cd again, only save the last one
 setopt HIST_IGNORE_DUPS
#
# # Even if there are commands inbetween commands that are the same, still only save the last one
 setopt HIST_IGNORE_ALL_DUPS

source ~/.zsh_config/zsh_ohmzsh

source ~/.zsh_config/zsh_alias
source ~/.zsh_config/zsh_config
