# global bootstrap utilities
src_dir=$DOTFILES_DIR/src

# load env file, shell source file or print not found message
# if ends in .exports then source
function load {
    # return if not a file
    if [[ ! -e "${1}" ]]; then
        echo "File not found. ${1}"
        return
    fi

    # load environment vars if .exports or .env
    if [[ "${1}" = *.env || "${1}" = *.exports ]];then
        \. bashenv "${1}"
    else
        source "${1}"
    fi
}

# list of shared files for sourcing
files=(
    # initialize system profile
    /etc/profile

    # global zsh source files
    $src_dir/load.sh 
)

