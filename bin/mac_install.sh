# set os
export OS="mac"

# set up defaults
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
if [ -z "$PERSONAL_DIR" ]; then
    export PERSONAL_DIR=$HOME/.personal
fi

# switch homebrew zsh to be default shell
sudo sh -c 'echo "/usr/local/bin/zsh" > /etc/shells'
sudo sh -c 'chsh -s /usr/local/bin/zsh'

# source install functions 
source $DOTFILES_DIR/src/install.sh

# install components of machine as needed
submodules
symlinks

