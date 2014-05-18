# install submodules if not properly installed
# make this script callable from anywhere!
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PERSONAL_DIR="$HOME/.personal"

git submodule foreach --recursive git submodule update --init

# install oh-my-zshell
if [ ! -d $HOME/.oh-my-zsh ]; then
	git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

# install symlinks
for symlink in $(ls symlinks | grep -v plist); do
	# override any symlinks currently existing
	ln -f -s $DIR/symlinks/$symlink $HOME/.$symlink
done

# install personal symlinks
if [ -d $PERSONAL_DIR && -d $PERSONAL_DIR/symlinks ]; then
  for symlink in $(ls $PERSONAL_DIR/symlinks); do
    ln -f -s $PERSONAL_DIR/symlinks/$symlink $HOME/.$symlink
  done
fi

# install dependencies [homebrew, homebrew formulae, casks, python, rubygems, npm modules]

