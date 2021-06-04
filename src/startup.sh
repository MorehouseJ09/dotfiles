# startup commands to be run on every new shell or reload
if (( $+commands[keychain] )); then
  if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
      source ~/.gnupg/.gpg-agent-info
      export GPG_AGENT_INFO
  else
      eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
  fi

  ## start a new gpg-agent for this process
  eval `keychain --eval -q --agents gpg`
  export GPG_PID=`echo $GPG_AGENT_INFO | awk '{ split($0,a,":"); print a[2] }'`

  # now store this current tty/pid in /tmp/gpg_agents
  gpg_file="/tmp/gpg_agents"
  echo "$(tty) $GPG_PID" >> $gpg_file
  export GPG_TTY=$(tty)

  # update pinentry tty to use current tty
  echo UPDATESTARTUPTTY | gpg-connect-agent >> /dev/null
fi

if [[ $(type load) =~ ".*function$" && -f .env ]];then
  load .env 2&> /dev/null
fi

if ! ssh-add -l > /dev/null; then
  echo "adding ssh-key for new session"
  ssh-add ~/.ssh/id_rsa
fi
