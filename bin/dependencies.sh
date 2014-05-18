brew bundle $DOTFILES_DIR/dependencies/Brewfile
pip install -r $DOTFILES_DIR/dependencies/requirements.txt
cd $DOTFILES_DIR/dependencies && npm install -g

if [ $OS == "mac" ];then
    while read line; do
        brew cask "$line"
    done < $DOTFILES_DIR/dependencies/Caskfile
fi
