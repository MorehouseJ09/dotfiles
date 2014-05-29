#!/usr/bin/env zsh

# install rvm
\curl -sSL https://get.rvm.io | bash

# install latest rvm
rvm install latest

# install and symlink macruby if on mac
if [[ $OS = "mac" ]]; then
    rvm install macruby --create
    # symlink macruby to the correct location
    bin=$(rvm info macruby binaries | grep bin/ruby | awk '{ print $2 }' | sed 's|"||g')
    sudo sh -c "ln -sf $bin /usr/bin/macruby"
fi
