# prompt name
function prompt_char {

    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function machine_name {
    if [ -f $HOME/.machine ]; then
        echo `cat $HOME/.machine`:
    fi
}

function prompt_path {
    
    current_prefix=""
    # normalize the path to use a tilda!
    if [[ $(pwd) = $HOME/* ]]; then
        current_prefix="~" 
    fi
    
    # grab main body
    body=`pwd | sed 's|'$HOME'||g' | awk '{ n=split($1,a,"/")} END{ print a[n-1] "/" a[n] }'`
    echo "${current_prefix}${body}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
