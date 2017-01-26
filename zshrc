#!/bin/zsh

# Killer: share history between multiple shells
setopt SHARE_HISTORY
#
# # If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS
#
# # Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS


if [[ ! `hostname -s` =~ 'submit-3' ]]; then
  source $HOME/.zsh_config/zsh_config
fi

source $HOME/.zsh_config/zsh_perso

source $HOME/.zsh_config/zsh_alias



if [[ `hostname -s` =~ 'CoffeeBean' || `hostname` =~ 'engr.wisc.edu' ]]; then
  export COMP='mbp'
  source $HOME/.zsh_config/zsh_local
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
elif [[ `hostname -s` =~ 'submit-3' ]]; then
  export COMP='htc'
  source $HOME/.zsh_config/zsh_condor
elif [[ `hostname -s` =~ 'kermit' ]]; then
  export COMP='kermit'
  source $HOME/.zsh_config/zsh_kermit
elif [[ `hostname -s` =~ 'raspberrypi' ]]; then
  export COMP='rπ3'
  source $HOME/.zsh_config/zsh_pi
fi

source $HOME/.zsh_config/zsh_ohmzsh
