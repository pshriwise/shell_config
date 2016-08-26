#!/bin/zsh

# Killer: share history between multiple shells
 setopt SHARE_HISTORY
#
# # If I type cd and then cd again, only save the last one
 setopt HIST_IGNORE_DUPS
#
# # Even if there are commands inbetween commands that are the same, still only save the last one
 setopt HIST_IGNORE_ALL_DUPS


source $HOME/.zsh_config/zsh_config
source $HOME/.zsh_config/zsh_perso

source $HOME/.zsh_config/zsh_alias

<<<<<<< c6ab587dbaf490b5ffa41c2adf93a3937eb8b3ff
if [[ `hostname -s` =~ 'CoffeeBean' || `hostname -s` =~ 'd128104185199' ]]; then
  echo "Loading CoffeeBean config"
=======
if [[ `hostname -s` =~ 'CoffeeBean' || `hostname -s` =~ 'd128104184078' ]]; then
>>>>>>> add kermit config
  source $HOME/.zsh_config/zsh_local
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
elif [[ `hostname -s` =~ 'kermit' ]]; then
  source $HOME/.zsh_config/zsh_kermit
elif [[ `hostname -s` =~ 'submit-3' ]]; then
  echo "Loading HTC config"
  source $HOME/.zsh_config/zsh_condor
elif [[ `hostname -s` =~ 'kermit' ]]; then
  echo "Loading kermit config"
  source $HOME/.zsh_config/zsh_kermit
fi

source $HOME/.zsh_config/zsh_ohmzsh
