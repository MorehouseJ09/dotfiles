# set dotfiles directory
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$HOME/dotfiles
fi
# set personal directory
if [ -z "$PERSONAL_DIR" ]; then
    export PERSONAL_DIR=$HOME/.personal
fi

# set os in script readable form
if [ -z "$OS" ]; then
    export OS="linux"
    # load mac / linux specific if necessary
    if [ $OSTYPE == "darwin13.0.0" ] ;then 
        export OS="mac"
    fi
fi

# source the bootstrap lib
source $DOTFILES_DIR/src/bootstrap.sh

# load each of the into our current shell
for file in $files
do
    load $file
done

# load default environment files
load $HOME/.env
load $HOME/.$OS.env

# load personal files
if [ -d $PERSONAL_DIR ]; then
    for file in `ls $PERSONAL_DIR/src`
    do
        load $PERSONAL_DIR/src/$file
    done
fi

# load in default env / exports file if set
if [[ ! -z "$EXPORTS_FILE" && -f $EXPORTS_FILE ]]
then
    load $EXPORTS_FILE
fi

# load in temp environment file
load $HOME/.temp.env

