function submodules {

    git submodule foreach --recursive git submodule update --init
    
    # install oh-my-zshell
    if [ ! -d $HOME/.oh-my-zsh ]; then
        git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    fi

    # install linux brew if not on mac
    if [ "$OS" == "linux" ]; then
        git clone git://github.com/homebrew/linuxbrew $HOME/.linuxbrew
    fi

}

function symlinks() {
    
    # install all symlinks to $HOME
    for dir in "$DOTFILES_DIR" "$PERSONAL_DIR"; do
        for symlink in $(ls $dir/symlinks); do
            ln -f -s $dir/symlinks/$symlink $HOME/.$symlink
        done 
    done

}

# install dependencies [homebrew, homebrew formulae, casks, python, rubygems, npm modules]
function dependencies {

    #brew bundle $DOTFILES_DIR/dependencies/Brewfile
    #pip install -r $DOTFILES_DIR/dependencies/requirements.txt

    if [ $OS == "mac" ];then
        echo "install casks"
    fi

}



