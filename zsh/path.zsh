PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

PATH=$HOME/bin:$PATH

# cabal
PATH=$HOME/.cabal/bin:$PATH

# stack
PATH=$HOME/.local/bin:$PATH

case `uname` in
  Darwin)
    TEXLIVE=/usr/local/texlive
    if [ -d $TEXLIVE ]; then
      TEXLIVE_VERSION=`basename $(ls -d $TEXLIVE/2* | tail -1)`
      PATH=$TEXLIVE/$TEXLIVE_VERSION/bin/x86_64-darwin:$PATH
    fi

    PATH=$HOME/Library/Haskell/bin:$PATH
    ;;
esac

export GOPATH=$HOME/go
