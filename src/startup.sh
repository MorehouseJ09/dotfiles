# startup commands to be run on every new shell or reload
if (( $+commands[keychain] )); then

    # start a new gpg-agent for this process
    eval `keychain --eval -q --inherit any`
    export GPG_PID=`echo $GPG_AGENT_INFO | awk '{ split($0,a,":"); print a[2] }'`
    
    # handle gpg_processes 
    gpg_file="/tmp/gpg_agents"

    # now store this current tty/pid in /tmp/gpg_agents
    echo "$(tty) $GPG_PID" >> $gpg_file

    # export GPG_TTY so that this tty is used here locally
    export GPG_TTY=$(tty)

    # now loop through the tty_file and attempt to identify tty's that don't exist
    while read p; do

        # initialize tty/pid variables for this particular process
        current_tty=`echo $p | awk '{ print $1 }'`
        current_pid=`echo $p | awk '{ print $2 }'`

        # delete the gpg_agent process if tty doesn't exist, or tty is not linked to the current tty
        # check if old tty exists
        ps -lt $current_tty 2&>1 > /dev/null

        if [ $? -gt 0 ]; then
            kill -9 "$current_pid"
        elif [[ $current_tty = $GPG_TTY && ! $current_pid = $GPG_PID ]]; then
            kill -9 "$current_pid"
        else 
            
            # keep storing the process
            echo $p
            echo $p >> $gpg_file.tmp
        fi
    done < $gpg_file

    # reset gpg_agents file
    mv $gpg_file.tmp $gpg_file
fi


