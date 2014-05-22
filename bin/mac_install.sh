# set os
export OS="mac"

# set up defaults
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
if [ -z "$PERSONAL_DIR" ]; then
    export PERSONAL_DIR=$HOME/.personal
fi

# source install functions 
source $DOTFILES_DIR/src/install.sh

# now call install functions as needed
submodules
symlinks

