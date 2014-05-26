# prompt name
function prompt_char {

    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function machine_name {
    if [ -f $HOME/.machine ]; then
        echo `cat $HOME/.machine`:
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
