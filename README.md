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

## References / Inspiration

* [dotfiles.github.io](http://dotfiles.github.io/)
* [Adam V Dotfiles](https://github.com/adamv/dotfiles)





