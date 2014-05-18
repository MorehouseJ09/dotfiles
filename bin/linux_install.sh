# set os
export OS="linux"

# set dotfiles directory
if [ -z "$DOTFILES_DIR" ]; then
	source $DOTFILES_DIR/src/install.sh
else # recommended dotfiles directory 
	source $HOME/dotfiles/src/install.sh
fi

# install dependencies for homebrew
sudo apt-get install -y sudo apt-get install build-essential curl git ruby \
    texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

# setup dotfiles
submodules
symlinks

# load up environment before installing dependencies
source $DOTFILES_DIR/bin/bootstrap.sh

dependencies


