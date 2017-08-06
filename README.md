# dotfiles

This repository contains a bunch of configuration files I use on my machines.

After cloning this repository you may want to initialize the submodules and
install links to your home directory.

    $ git submodule init
    $ git submodule update
    $ ./link.sh

Some utilities require additional dependencies to be installed:

    $ bundle install

## Vim

Install native extension for `vimproc` plugin

    :VimProcInstall

Install packages for Haskell development

    $ stack install <package>

Packages:

- ghc-mod
- stylish-haskell
