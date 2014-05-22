#!/usr/bin/zsh

# set default shell
sudo sh -c 'echo "/usr/bin/zsh" > /etc/shells'
sudo sh -c 'chsh -s /usr/bin/zsh'

# set os
export OS="linux"

# set up defaults
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
if [ -z "$PERSONAL_DIR" ]; then
    export PERSONAL_DIR=$HOME/.personal
fi
source $DOTFILES_DIR/src/install.sh

## install dependencies for homebrew / environment
sudo apt-get update
sudo apt-get install -y build-essential curl git ruby zsh \
    texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

# set up rake for homebrew to use properly
sudo gem install rake
sudo ln -sf `which rake` /usr/bin/rake


# load installation functions
source $DOTFILES_DIR/src/install.sh
submodules
symlinks

# finally, set up some of our main development directories as fit
for i in "programs" ".public"
do
    if [ ! -d $HOME/$i ]; then
        mkdir $HOME/$i
    fi
done


