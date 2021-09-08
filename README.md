# dotfiles

This repository contains a bunch of configuration files I use on my machines.

After cloning this repository you may want to initialize the submodules and install links to your home directory.

    $ git submodule init
    $ git submodule update
    $ ./link.sh

Some utilities in the `bin` directory require additional dependencies to be installed:

    # macOS
    $ brew bundle

    $ bundle install

## Vim

Install native extension for `vimproc` plugin

    :VimProcInstall

Install packages for Haskell development

    $ stack install <package>

Packages:

- ghc-mod
- stylish-haskell

## Bitmap fonts

- [UW ttyp0](https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/)

## Xmonad

Prerequisites

- amixer
- gmrun
- rofi

## Setup Instructions

### Raspberry Pi (Raspbian)

Setup `zsh`

    $ sudo apt install zsh
    $ chsh -s /usr/bin/zsh
