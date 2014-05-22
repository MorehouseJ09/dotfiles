# startup commands to be run on every new shell or reload
if (( $+commands[keychain] )); then
    eval `keychain --eval -q`
fi
