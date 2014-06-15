# set os
export OS="mac"

# set up defaults
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
if [ -z "$PERSONAL_DIR" ]; then
    export PERSONAL_DIR=$HOME/.personal
fi

# switch homebrew zsh to be default shell
sudo sh -c 'echo "/usr/local/bin/zsh" > /etc/shells'
sudo sh -c 'chsh -s /usr/local/bin/zsh'

# source install functions 
source $DOTFILES_DIR/src/install.sh

# install components of machine as needed
submodules
symlinks
gpg_setup

# configure osx dock so that login.sh works properly
#f=/System/Library/CoreServices/Dock.app/Contents/Resources/DockMenus; sudo cp $f.plist $f-old.plist; sudo defaults write $f finder-running -array-add '<dict><key>command</key><integer>1004</integer><key>name</key><string>REMOVE_FROM_DOCK</string></dict>'; sudo chmod 644 $f.plist; osascript -e 'quit app "Dock"'
#f=/System/Library/CoreServices/Dock.app/Contents/Resources/DockMenus; sudo cp $f.plist $f-old.plist; sudo defaults write $f trash -array-add '<dict><key>command</key><integer>1004</integer><key>name</key><string>REMOVE_FROM_DOCK</string></dict>'; sudo chmod 644 $f.plist; osascript -e 'quit app "Dock"'

# add finder quit abilities
sudo defaults write com.apple.finder QuitMenuItem -bool YES
# keep finder from restarting
sudo mv /System/Library/CoreServices/Finder.app /Applications/
sudo rm /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist

# never show dock 
sudo defaults write com.apple.dock autohide-time-modifier -int 500; killall Dock
# reset to default
defaults delete com.apple.dock autohide-time-modifier; killall Dock

