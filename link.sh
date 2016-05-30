#!/bin/sh
tmp=`pwd`
cd
link() {
  if [ -e $2 -a ! -L $2 ]; then
    echo "E: $2 is not a symlink"
  elif [ -L $2 ]; then
    target=`readlink $2`
    if [ $target = $tmp/$1 ]; then
      echo "$2 is already linked"
    else
      echo "$2 is linked, but points at wrong target"
    fi
  else
    ln -s $tmp/$1 $2
    echo "linked $2"
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
case `uname` in
  Linux)
    link x11/Xresources .Xresources
    link x11/Xmodmap .Xmodmap
    link z/z.sh .zsh/z.sh
    ;;
esac
