###
### Networking aliases
###
# ip helpers
alias local_ip='ipconfig getifaddr en0'

# show open ports
alias open_ports='netstat -vatn'

# clear dns locally
alias dns-flush='sudo discoveryutil mdnsflushcache'

# show which listeners on the machine
alias listeners='lsof -i -n | egrep "COMMAND|LISTEN"'

# server information
alias nmap='sudo nmap ${1} -O'

# forward ports from 80 to 8080 so that I can run the server as a normal user!
alias forward_ports='sudo ipfw add 100 fwd 127.0.0.1,8080 tcp from any to any 80 in'

# turn notifications on or off really quickly ...
alias non='launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist;'
alias noff='launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist; killall NotificationCenter'

# turn ssh / remote login on or off 
alias ssh_on='sudo systemsetup -setremotelogin on'
alias ssh_off='sudo systemsetup -setremotelogin off'

# refresh mac
alias refresh_mac='killall -KILL SystemUIServer; killall -KILL Dock; killall -KILL Finder; sudo killall coreaudiod'

###
### Mac GUI aliases
###

# lock the machine
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# unmount a disk
function eject {

    diskutil unmountDisk $1
    diskutil eject $1
}

# show current power on the command line
function power {

    /usr/sbin/ioreg -l | awk 'BEGIN{a=0;b=0} 
    $0 ~ "MaxCapacity" {a=$5;next}  
    $0 ~ "CurrentCapacity" {b=$5;nextfile}
    END{printf("%.2f", b/a * 100);print("%")}'
}

