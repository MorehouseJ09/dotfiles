# startup commands to be run on every new shell or reload
if (( $+commands[keychain] )); then
    # check to see if a tty with this name exists
    #cat /tmp/gpg_ttys | grep `tty`

    # start a new gpg-agent for this process
    eval `keychain --eval -q --inherit any`
    export GPG_PID=`echo $GPG_AGENT_INFO | awk '{ split($0,a,":"); print a[2] }'`
    
    # now store this current tty/pid in /tmp/gpg_agents
    echo "$tty $GPG_PID" >> /tmp/gpg_agents
    export GPG_TTY=`tty`

    # now loop through the tty_file and attempt to identify tty's that don't exist
    while read p; do

        # initialize tty/pid variables for this particular process
        current_tty=`echo $p | awk '{ print $1 }'`
        current_pid=`echo $p | awk '{ print $2 }'`

        if [[ ! -d $current_tty || ! "$current]] then; 
            
            || $current_tty = $GPG_TTY && ! $current_pid = $GPG_PID ]]; then
            echo "$current_tty $current_pid needs deleting"
        else
            echo "keep"
        fi

    done < /tmp/gpg_agents
fi


