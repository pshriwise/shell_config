#!/bin/bash

# Grab all submodules
git submodule update --init --recursive


# Backing-up the existing file
mv ~/.zshrc ~/.zshrc_bak

# Installing the new config
ln -s ~/.zsh_config/zshrc ~/.zshrc
ln -s ~/.zsh_config/git-change-url ~/.local/bin/
