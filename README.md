# dotfiles

> an opinionated work environment for both mac and ubuntu development 

## Installation Instructions

~~~ sh
$ git clone --recursive git@github.com:jonmorehouse/dotfiles $HOME/dotfiles

# or install to a different directory
$ git clone --recursive git@github.com:jonmorehouse/dotfiles ~/some_dir
$ export DOTFILES_DIR=~/some_dir

# now bootstrap the installation to set up all symlinks, dependencies etc
$ ./bin/mac_install
~~~

## Project Structure

1. `src/` shareable zsh aliases, functions and short scripts
2. `dependencies/` shareabled dependencies for setup. [Homebrew Formulae, Gems, pip modules, npm modules]
3. `git-template/` git template for gitconfiguration to use
4. `symlinks/` symlinked files for configuration
5. `scripts/` scripts to be added to path. Global scripts / short-programs

## Customizing

This project depends upon a "personal" directory with the same structure. I recommend placing this in `$HOME/.personal`. Install script will symlink all personal/symlinks. Bootstrap script will load all personal/src

## ENV Files

I usually have env settings for different work environments, for instance a personal env and a work environment. In my `$HOME/.personal/symlinks` I keep a `personal.env` file and a `work.env` file with settings for each environment. By setting the environment variable `EXPORTS_FILE` you can specify a default environment to be bootstrapped at terminal startup.

## References / Inspiration

* [dotfiles.github.io](http://dotfiles.github.io/)
* [Adam V Dotfiles](https://github.com/adamv/dotfiles)

