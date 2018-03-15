

## Patrick Shriwise's Shell Configuration Scripts

This repository contains a set of scripts inteded for use configuration of and
arbitrary linux machine for ease of use.

To configure a machine:

  1. clone this repository into the directory `$HOME/.bash`
  2. initialize all submodules using `git submodule init`
  3. checkout all modules using `git submodule update`
  4. run the `setup.sh` script in the top level of this repository

### Shell Environments

This script will create symlinks in the proper locations to support both `bash`
(using the symlinked `.bashrc` file) ad `zsh` (using the sym-linked `.zshrc`
file). Both of these configurations come with a set of common aliases which can
be found in `commonrc`.

#### Machine-Specific Configuration

The config file `machinesrc` is always included via the `commonrc` file during
configuration. This file will search for a file in the `/machines` diretory
which matches the machine name. If one is found, then its configuration will be
applied. To add a configuration for a specific machine, add a configuration file
in the `/machines` directory with the appropriate name.

### Other System Configurations

The `setup.sh` script will also install custom configuration files for several
programs I commonly use including:

  - git
  - emacs
  - GNU Make
  - Thunderbird

### Additional programs/scripts

The `setup.sh` script also locally installs a couple of scripts for programs I
commonly use. These scripts and other aliases expect that the following
programs are installed:

  - emacs
  - git
  - thunderbird
  - pianobar
  - jekyll
  - mpsyt

An installation script for **most** of these packages is provided as
`prerequisites.sh`. In partuclar, the `mpsyt` package will need to be installed
manually.

