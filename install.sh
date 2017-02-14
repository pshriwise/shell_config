#!/bin/bash

# Getting Omzsh & fonts for iterm
git clone https://github.com/bam241/oh-my-zsh.git oh-my-zsh
git clone https://github.com/powerline/fonts.git

git clone http://github.com/zsh-users/zsh-syntax-highlighting.git oh-my-zsh/plugins/zsh-syntax-highlighting
git clone http://github.com/rhysd/vim-clang-format.git vim/vim-clang-format


# Backing-up the existing file
mv ~/.zshrc ~/.zshrc_bak

# Installing the new config
ln -s ~/.zsh_config/zshrc ~/.zshrc
ln -s ~/.zsh_config/git-change-url ~/.local/bin/
