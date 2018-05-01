function symlinks() {
    # install all symlinks to $HOME
    for dir in "$DOTFILES_DIR" "$PERSONAL_DIR"; do
        if [ ! -d $dir ]; then
            continue
        fi
        for symlink in $(ls $dir/symlinks); do
            ln -f -s $dir/symlinks/$symlink $HOME/.$symlink
        done
    done
}

function gpg_setup() {
    gpg
    ln -sf $HOME/.gpg.conf $HOME/.gnupg/gpg.conf
    ln -sf $HOME/.gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
}
