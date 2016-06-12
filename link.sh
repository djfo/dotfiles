#!/bin/sh
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
link ghci .ghci
link bin bin
link git/gitconfig .gitconfig
link git .git
link vim/vimrc .vimrc
link vim .vim
link vim-pathogen/autoload/pathogen.vim .vim/autoload/pathogen.vim
link emacs/emacs .emacs
case `uname` in
  Linux)
    link x11/Xresources .Xresources
    link x11/Xmodmap .Xmodmap
    link z/z.sh .zsh/z.sh
    md local
    link color local/color
    link xmonad .xmonad
    ;;
esac
