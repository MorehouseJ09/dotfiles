# set os
export OS="linux"

# set dotfiles directory
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
source $DOTFILES_DIR/src/install.sh

# install dependencies for homebrew / environment
sudo apt-get update
sudo apt-get install -y build-essential curl git ruby zsh \
    texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

# set default shell
sudo echo `which zsh` >> /etc/shells
sudo chsh -s `which zsh`

# load installation functions
source $DOTFILES_DIR/src/install.sh
submodules
symlinks


