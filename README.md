# dotfiles

This repository contains a bunch of configuration files I use on my machines.

After cloning this repository you may want to initialize the submodules and
install links to your home directory.

    $ git submodules init
    $ git submodules update
    $ ./link.sh

Some utilities require additional dependencies to be installed:

    $ bundle install

## Vim

Install native extension for `vimproc` plugin

    :VimProcInstall
