#!/bin/bash

# exit on error
set -e

sudo apt-get install -Y \
     git \
     emacs \
     thunderbird \
     pianobar \
     ruby \
     ruby-dev \
     make \
     gcc
     
gem install jekyll 
