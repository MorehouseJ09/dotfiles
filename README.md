# dotfiles

> an opinionated work environment for both mac and ubuntu development 

## Installation Instructions

~~~ sh
$ git clone --recursive git@github.com:jonmorehouse/dotfiles $HOME/dotfiles

# or install to a different directory
$ git clone --recursive git@github.com:jonmorehouse/dotfiles ~/some_dir
$ export DOTFILES_DIR=~/some_dir

# install and set up a mac
$ ./bin/mac_install.sh

# install and set up linux - tested and developed primarily for ubuntu 12.04
$ ./bin/linux_install.sh

# now install all dependencies (this will take a while and isn't required)
$ ./bin/dependencies.sh # install brews,casks,pips,gems,npms and vim
~~~

## Project Structure

1. `src/` shareable zsh aliases, functions and short scripts
2. `dependencies/` shareabled dependencies for setup. [Homebrew Formulae, Gems, pip modules, npm modules]
3. `git-template/` git template for gitconfiguration to use
4. `symlinks/` symlinked files for configuration
5. `scripts/` scripts to be added to path. Global scripts / short-programs

## Customizing

This project depends upon a "personal" directory with the same structure as this project. 

I recommend placing this in `$HOME/.personal`. Installation will symlink all `personal/symlinks` to `$HOME/` and will source all files in `personal/src` on startup.

## ENV Files

I usually have env settings for different work environments, for instance a personal env and a work environment. In my `$HOME/.personal/symlinks` I keep a `personal.env` file and a `work.env` file with settings for each environment. 

By setting the environment variable `EXPORTS_FILE` you can specify a default environment to be bootstrapped at terminal startup.

## References / Inspiration

* [dotfiles.github.io](http://dotfiles.github.io/)
* [Adam V Dotfiles](https://github.com/adamv/dotfiles)

