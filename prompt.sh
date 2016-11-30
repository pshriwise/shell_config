source $GITAWAREPROMPT/colors.sh

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
      git_dirty='*'
  else
      git_dirty=''
  fi
}

branch_color() {
    #start color as red in case one of these conditions is wrong
    branch_color=$txtred
    #check for a clean repo
    local status=$(git status --porcelain 2> /dev/null)
    if [[ "$status" == "" ]]; then
	branch_color=$txtcyn
    fi

    #check for staged changes
    local status=$(git diff --cached HEAD 2> /dev/null)
    if [[ "$status" != "" ]]; then
	branch_color=$txtylw
    fi
    
    echo "\["$branch_color"\]"
}

ps1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]"
PROMPT_COMMAND="find_git_branch; find_git_dirty; PS1=\"${ps1}\$(branch_color)\$git_branch\[$txtrst\]:\$\"; $PROMPT_COMMAND"

# Default Git enabled prompt with dirty state
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Another variant:
# export PS1="\[$bldgrn\]\u@\h\[$txtrst\] \w \[$bldylw\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "

# Default Git enabled root prompt (for use with "sudo -s")
# export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
