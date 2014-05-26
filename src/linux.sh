# system wide aliases
alias se='apt-cache search'
alias in='sudo apt-get install -y'

# general one-liners
alias export_display='export DISPLAY=:0'

function unlock {

    export DISPLAY=:0 
    gnome-screensaver
    gnome-screensaver-command -d
}

function lock {

    export DISPLAY=:0 
    gnome-screensaver
    gnome-screensaver-command -l
}


