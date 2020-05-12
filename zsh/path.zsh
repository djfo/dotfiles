source ~/.zsh/os.zsh

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

PATH=$HOME/bin:$PATH

# cabal
PATH=$HOME/.cabal/bin:$PATH

# stack
PATH=$HOME/.local/bin:$PATH

if darwin; then
  # TeX Live
  TEXLIVE=/usr/local/texlive
  if [ -d $TEXLIVE ]; then
    TEXLIVE_VERSION=`basename $(ls -d $TEXLIVE/2* | tail -1)`
    PATH=$TEXLIVE/$TEXLIVE_VERSION/bin/x86_64-darwin:$PATH
  fi

  PATH=$HOME/Library/Haskell/bin:$PATH

  # Python (user install directory)
  for each in `basename $(ls $HOME/Library/Python)`; do
    PATH=$HOME/Library/Python/$each/bin:$PATH
  done

  PATH=/usr/X11/bin:$PATH

  if [ -d /usr/local/opt/ruby/bin ]; then
    PATH=/usr/local/opt/ruby/bin:$PATH
  fi
fi

export GOPATH=$HOME/go
