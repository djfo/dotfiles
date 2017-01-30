PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
PATH=$HOME/bin:$HOME/.cabal/bin:$PATH

case `uname` in
  Darwin)
    PATH=/usr/local/texlive/2015/bin/x86_64-darwin:$PATH
    PATH=$HOME/Library/Haskell/bin:$PATH
    ;;
esac
