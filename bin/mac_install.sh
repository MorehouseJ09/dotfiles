# set dotfiles directory
if [ -z "$DOTFILES_DIR" ]; then
	source $DOTFILES_DIR/src/install.sh
else
	source $HOME/dotfiles/src/install.sh
fi

submodules
symlinks
dependencies

