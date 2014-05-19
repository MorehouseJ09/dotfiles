# install rvm
\curl -sSL https://get.rvm.io | bash

# install all brews
brew bundle $DOTFILES_DIR/dependencies/Brewfile

# install all python components
pip install -r $DOTFILES_DIR/dependencies/requirements.txt

# install all node modules globally
cd $DOTFILES_DIR/dependencies && npm install -g

# install casks on mac
if [ $OS == "mac" ];then
    while read line; do
        brew cask "$line"
    done < $DOTFILES_DIR/dependencies/Caskfile
fi

# set up vim
if [ ! -d $HOME/.vim ];then
  
    # clone vimfiles
    git clone https://github.com/jonmorehouse/vim $HOME/.vim 
    # install all plugins
    vim +PluginInstall +qall
fi


