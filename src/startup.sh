# startup commands to be run on every new shell or reload
if (( $+commands[keychain] )); then

    # start a new gpg-agent for this process
    eval `keychain --eval -q`
    export GPG_PID=`echo $GPG_AGENT_INFO | awk '{ split($0,a,":"); print a[2] }'`
    
    # handle gpg_processes
    gpg_file="/tmp/gpg_agents"

    # now store this current tty/pid in /tmp/gpg_agents
    echo "$(tty) $GPG_PID" >> $gpg_file

    # export GPG_TTY so that this tty is used here locally
    export GPG_TTY=$(tty)

    # update pinentry tty to use current tty
    echo UPDATESTARTUPTTY | gpg-connect-agent >> /dev/null

    # run gpg-bootstrap if we have a .passphrase file
    if [ -f $HOME/.passphrase ]; then 
        gpg-bootstrap 
    fi
fi
