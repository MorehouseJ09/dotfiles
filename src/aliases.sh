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
### Tmux shortcut aliases
###
alias tn='tmux new-session -s'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias tka='tmux kill-server'
alias tr='tmux source-file ~/.tmux.conf'
alias tk='tmux kill-window -t '
alias talt='TMUX_CONF=$HOME/.alt.tmux.conf tmux'

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
# Show history
alias history='fc -l 1'

# watch a command
alias watch='watch -n 1'
alias watch_dir='watch -n 1 "du -sh *"'

# show numberical permissions on file
alias permissions='gstat -c "%a %n"'

# start a simple server
alias simple_server='python -m SimpleHTTPServer'

# ec2 / aws specific
alias ec2-host='ec2-host -r $AWS_REGION'
alias ec2-ssh='ec2-ssh -r $AWS_REGION'

# awk shortcuts
for i in {1..20}
do
  command="awk '{ print \$$i }'"
  eval alias "awk$i"='${command}'
done

# set current alias
if [[ -f $HOME/.current ]];then
  dir=`cat $HOME/.current`
  eval alias "cr='cd ${dir}'"
fi

