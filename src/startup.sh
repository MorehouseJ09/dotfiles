# startup commands to be run on every new shell or reload
if (( $+commands[keychain] )); then

    # start a new gpg-agent for this process
    eval `keychain --eval -q`
    export GPG_PID=`echo $GPG_AGENT_INFO | awk '{ split($0,a,":"); print a[2] }'`
    
    # export GPG_TTY so that this tty is used here locally
    export GPG_TTY=$(tty)
fi


