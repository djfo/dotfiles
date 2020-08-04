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
  if [ -d $HOME/Library/Python ]; then
    for each in `ls $HOME/Library/Python`; do
      PATH=$HOME/Library/Python/`basename $each`/bin:$PATH
    done
  fi

  PATH=/usr/X11/bin:$PATH

  if [ -d /usr/local/opt/ruby/bin ]; then
    PATH=/usr/local/opt/ruby/bin:$PATH
  fi

  USDPYTHON_BASEPATH=/Applications/usdpython
  if [ -d $USDPYTHON_BASEPATH ]; then
    PATH=$PATH:$USDPYTHON_BASEPATH/USD:$PATH:$USDPYTHON_BASEPATH/usdzconvert;
    export PYTHONPATH=$PYTHONPATH:$USDPYTHON_BASEPATH/USD/lib/python
  fi
fi

export GOPATH=$HOME/go

which -s opam > /dev/null && eval $(opam env)
