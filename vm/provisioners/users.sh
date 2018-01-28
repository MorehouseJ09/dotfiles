#!/usr/bin/env bash

set -e
set -o pipefail
set -u

echo "adding ssh key into authorized_keys ..."
curl -s https://github.com/jonmorehouse.keys >> ~core/.ssh/authorized_keys

touch ~core/.hush_login

echo "removing .bashrc symlink ..."
rm ~core/.bashrc

echo "writing out basic .bashrc file ..."
cat << EOF > ~core/.bashrc
set -o vi
bind '"jk":"\e"'
bind '"kj":"\e"'
EOF

echo "writing out basic .vimrc file ..."
cat << EOF > ~core/.vimrc
set modeline
imap jk <ESC>
imap kj <ESC>
EOF

echo "symlinking /programs into ~/programs ..."
ln -sf /programs ~core/programs
