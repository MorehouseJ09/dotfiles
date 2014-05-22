function submodules {

    git submodule foreach --recursive git submodule update --init
    
    # install oh-my-zshell
    if [ ! -d $HOME/.oh-my-zsh ]; then
        git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    fi

    # install linux brew if not on mac
    if [ "$OS" == "linux" ]; then
        if [ ! -d $HOME/.linuxbrew ];then
            git clone git://github.com/homebrew/linuxbrew $HOME/.linuxbrew
        fi
    fi
}

function symlinks() {
    
    # install all symlinks to $HOME
    for dir in "$DOTFILES_DIR" "$PERSONAL_DIR"; do
        if [ ! -d $dir ]; then
            continue
        fi
        for symlink in $(ls $dir/symlinks); do
            ln -f -s $dir/symlinks/$symlink $HOME/.$symlink
        done 
    done

}




