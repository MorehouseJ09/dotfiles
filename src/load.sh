SRC_DIR=$DOTFILES_DIR/src

# any files that you want ignored go here!
ignored=(
    "load.sh"
    "install.sh"
    "zshell-theme.zsh"
)

for file in `ls $SRC_DIR`
do
    found=
    for ignore in ${ignored[@]}
    do
        if [ "$ignore" = "$file" ]
        then
            let found=true
        fi
    done

    # if the file shuold have been ignored - then go ahead and skip this $file
    if [ "$found" ]
    then
        continue
    # if not banned, load the file
    else
        load $SRC_DIR/$file
    fi
done
