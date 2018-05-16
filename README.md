# Jon Morehouse's dotfiles
> My opinionated approach to dotfiles


## Installation Instructions

~~~ sh
$ git clone --recursive git@github.com:jonmorehouse/dotfiles $HOME/dotfiles

# Install homebrew dependencies
$ brew tap homebrew/bundle
$ brew bundle --file=dependencies/Brewfile

# Install ruby/python dependencies from /dependencies
$ pip install -r dependencies/requirements.txt


# or install to a different directory
$ git clone --recursive git@github.com:jonmorehouse/dotfiles ~/some_dir
$ export DOTFILES_DIR=~/some_dir

# install and set up a mac
$ ./bin/install.sh
~~~



## Project Structure

1. `src/` shareable zsh aliases, functions and short scripts
2. `dependencies/` shareable dependencies for setup. [Homebrew Formulae, Gems, pip modules, npm modules]
4. `symlinks/` symlinked files for configuration
5. `scripts/` scripts to be added to path. Global scripts / short-programs

## GitConfig

This project exports a `$HOME/.gitsettings` file with shared aliases. When setting up your work environment to utilzie this project, you will need to create a `$HOME/.gitconfig` file like normal.

To use the included `gitsettings`, you will need to add the following line to your `.gitconfig` file:

~~~ config
[include]
  path = ~/.gitsettings
~~~


## Customization

This `dotfiles` setup is meant to work hand in hand with a similarly structured `$HOME/.personal` folder. For instance, any files in `$HOME/.personal/symlinks` will be symlinked automatically to `$HOME`. Similarly, any files in `$HOME/.personal/src` will be sourced on each new shell.

## Temporary Configuration

You may want to change your `$ENV`, add aliases or bash commands on a project by project basis. This `dotfiles` setup supports that by optionally loading three files: `$HOME/.temp.env`, `$HOME/.temp.sh` and `$HOME/.current`.

You can add any temporary `$ENV` flags by creating and maintaining a `.temp.env` file similar to any of the other `env` files in this project (eg: https://github.com/jonmorehouse/dotfiles/blob/master/symlinks/env).

`$HOME/.temp.sh` is sourced while bootstrapping any new terminal session. You can add aliases, variables or anything else in here.

Finally, `$HOME/.current` expects a text file of paths that should be aliased under the `cr` command. For instance if your `$HOME/.current` looked like this:

~~~ bash
$HOME/documents
$HOME/dotfiles
~~~

Then when you boot up a new shell, you would have two aliases:

~~~ bash
alias cr='cd $HOME/documents'
alias cr1='cd $HOME/dotfiles'
~~~

## GPG Agent

I don't use ssh-agent anymore, instead opting to use keychain and gpg-agent for ssh-key authentication. If you use a similar setup, you can symlink `$HOME/.gpg-agent.conf` to be used by your gpg-agent.

~~~ bash
$ ln -sf $HOME/.gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
~~~

### Automatically enter passphrases

While only recommended for safe working conditions, adding your passphrases to $HOME/.passphrase will automatically set them on the agent. This should prevent you from ever having to enter gpg/ssh keys while working. Simply removing the file will force manual entry.


## Solarized Color Scheme

I only use solarized, so this project assumes that you will have configured your terminal to use the solarized colorscheme. Things will probably look weird without it.

* [General Installation](http://ethanschoonover.com/solarized)

## References / Inspiration

* [dotfiles.github.io](http://dotfiles.github.io/)
* [Adam V Dotfiles](https://github.com/adamv/dotfiles)
* [Enable SSH on Chromebook](https://github.com/dnschneid/crouton/wiki/Running-servers-in-crouton)

