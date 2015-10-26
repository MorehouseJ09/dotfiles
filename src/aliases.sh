###
### Navigation Shortcuts
###
# basic navigation helpers
alias ~='cd ~'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias back='cd -'

###
### Tmux aliases
###
alias tn='tmux new-session -s'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias tka='tmux kill-server'
alias tr='tmux source-file ~/.tmux.conf'
alias tk='tmux kill-window -t '
alias talt='TMUX_CONF=$HOME/.alt.tmux.conf tmux'
alias ts='tmux switch -t'

###
### Directory View Shortcuts
###
alias lsa='ls -lah'
alias l='ls -lA1'
alias ll='ls -l'
alias lll='ls -l'
alias la='ls -lA'
alias al='ls -lA'
alias lal='ls -lA'
alias lar='ls -lAR'
alias sl=ls # often screw this up
alias lr='ls -lR'

###
###     General Shortcuts
###
alias zsh-benchmark='/usr/bin/time /usr/bin/env zsh -i -c exit'

# Show history
alias history='fc -l 1'

# watch a command
alias watch='watch -n 1'
alias watch_dir='watch -n 1 "du -sh *"'

# show numberical permissions on file
alias permissions='gstat -c "%a %n"'

# start a simple server
alias simple_server='python -m SimpleHTTPServer'

function random-key {
  (export LC_ALL=C; cat /dev/urandom | \tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1)
}

# awk shortcuts
for i in {1..20}
do
  command="awk '{ print \$$i }'"
  eval alias "awk$i"='${command}'
done

alias rows_to_columns=$'awk -v RS= -v OFS=\'\\n\' \'{\$1 = \$1} 1\''

# background/foreground shortcuts
counter=0
for i in a b c d; do
  let counter=$counter+1
  command="fg %$counter"
  kill_command="kill %$counter"
  eval alias "f$i"='${command}'
  eval alias "k$i"='${kill_command}'
done

# build aliases for current projects, as declared in the main file
if [[ -f $HOME/.current ]];then
  main_project=`cat $HOME/.current | head -n1`
  eval alias "c='cd ${main_project}'"

  counter=0
  for line in `cat $HOME/.current | tail -n +2`; do
    let counter=$counter+1
    eval alias "c${counter}='cd ${line}'"
  done
fi

## date shortcuts
alias epoch='date +%s'
alias utc='gdate --utc'

