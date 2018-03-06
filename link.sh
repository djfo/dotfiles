#!/bin/sh
. zsh/os.zsh
tmp=`pwd`
cd
escape() {
  echo "[$1m$2[0m"
}
err() {
  escape 31 "E: $1"
}
info () {
  escape 33 "I: $1"
}
msg() {
  escape 32 "$1"
}
link() {
  if [ -e $2 -a ! -L $2 ]; then
    err "$2 is not a symlink"
  elif [ -L $2 ]; then
    target=`readlink $2`
    if [ $target = $tmp/$1 ]; then
      info "$2 is already linked"
    else
      err "$2 is linked, but points at wrong target"
    fi
  else
    ln -s $tmp/$1 $2
    msg "linked $2"
  fi
}
md() {
  if [ -d $1 ]; then
    info "directory $1 already exists"
  elif [ -f $1 ]; then
    err "file $1 exists, but is not a directory"
  else
    mkdir -p $1
    msg "created directory $1"
  fi
}
link zsh .zsh
link zsh/zshrc .zshrc
link screenrc .screenrc
link tmux.conf .tmux.conf
link ghci .ghci
link bin bin
link git/gitconfig .gitconfig
if [ ! -e $HOME/.gitconfig.local ]; then
  cp $tmp/git/gitconfig.local .gitconfig.local
  msg "a template was copied to $HOME/.gitconfig.local, please edit this file"
fi
link vim/vimrc .vimrc
link vim .vim
link vim-pathogen/autoload/pathogen.vim .vim/autoload/pathogen.vim
link emacs/emacs .emacs
link xmonad .xmonad
link x11/Xresources .Xresources
if linux || freebsd; then
  link x11/Xmodmap .Xmodmap
  link x11/xinitrc .xinitrc
  link z/z.sh .zsh/z.sh
  md local
  link color local/color
elif darwin; then
  link x11-osx/Xdefaults .Xdefaults
  link x11-osx/xinitrc .xinitrc
fi
link mailcap .mailcap
