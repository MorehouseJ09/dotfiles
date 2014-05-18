function submodules {

    git submodule foreach --recursive git submodule update --init
    
    # install oh-my-zshell
    if [ ! -d $HOME/.oh-my-zsh ]; then
        git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    fi

    # install linux brew if not on mac
    if [ ]


}

function symlinks {
    
    # symlink 

    # symlink personal 


}

# install dependencies [homebrew, homebrew formulae, casks, python, rubygems, npm modules]
function dependencies {


}



