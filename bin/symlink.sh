#!/usr/bin/env zsh

# load the installer script
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
# set personal directory
if [ -z "$PERSONAL_DIR" ]; then
    export PERSONAL_DIR=$HOME/.personal
fi

# load installation helpers
source $DOTFILES_DIR/src/install.sh

# re-symlink all files
symlinks
