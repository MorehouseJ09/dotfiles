#!/usr/bin/env bash

set -e
set -o pipefail
set -u

echo "adding ssh key into authorized_keys ..."
curl -s https://github.com/jonmorehouse.keys >> ~/.ssh/authorized_keys

touch ~/.hush_login

echo "removing .bashrc symlink ..."
rm ~/.bashrc

echo "writing out basic .bashrc file ..."
cat << EOF > ~/.bashrc
set -o vi
bind '"jk":"\e"'
bind '"kj":"\e"'
EOF

echo "writing out basic .vimrc file ..."
cat << EOF > ~/.vimrc
set modeline
imap jk <ESC>
imap kj <ESC>
EOF
