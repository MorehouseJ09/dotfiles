# dotfiles

> an opinionated work environment for both mac and ubuntu development 

My local development stack includes zsh,tmux,vim,weechat,mutt,gpg and pass

## Solarized

I only use solarized, so this project assumes that you will have configured your terminal to use the solarized colorscheme. Things will probably look weird without it.

* [General Installation](http://ethanschoonover.com/solarized)
* [Chromebook / Secure Shell Installation](https://github.com/yuex/chrome-secure-shell-solarized)


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

I recommend placing this in `$HOME/.personal`. Installation will symlink all `personal/symlinks` to `$HOME/` and will source all files in `personal/src` on startup. For me, this lives as a private repository on github.

## ENV Files

I usually have env settings for different work environments, for instance a personal env and a work environment. In my `$HOME/.personal/symlinks` I keep a `personal.env` file and a `work.env` file with settings for each environment. 

By setting the environment variable `EXPORTS_FILE` you can specify a default environment to be bootstrapped at terminal startup. This will allow you to nest env files and then overlap variables by loading another one later.

~~~ bash
$ export EXPORTS_FILE=$HOME/.personal.env

echo EXPORTS_FILE=$HOME/.personal.env >> $HOME/.personal/src/config.env
~~~


## GPG Agent

I don't use ssh-agent anymore, instead opting to use keychain and gpg-agent for ssh-key authentication. If you use a similar setup, you can symlink `$HOME/.gpg-agent.conf` to be used by your gpg-agent.

~~~ bash
$ ln -sf $HOME/.gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
~~~


## References / Inspiration

* [dotfiles.github.io](http://dotfiles.github.io/)
* [Adam V Dotfiles](https://github.com/adamv/dotfiles)

