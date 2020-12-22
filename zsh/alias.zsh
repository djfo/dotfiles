for cmd in rm cp mv; alias $cmd="$cmd -i"

alias ...="cd ../.."
alias ..="cd .."
alias d-c="docker-compose"
alias d="darcs"
alias dh="dirs -v"
alias g="git"
alias gim="git -c core.fileMode=false"
alias h="history"
alias pd="popd"
alias ts="moreutils-ts"
alias vi="vim"

if linux; then
  alias ls="ls -F1 --color=auto"
  alias lc="ls -FC --color=auto"
  alias ll="ls -Fl --color=auto"

  alias du="du --si"
fi

if bsd; then
  alias ls="ls -GF1"
  alias lc="ls -GFC"
  alias ll="ls -GFlh"
  alias lx="exa -l --git"
  alias grep="grep --color=auto"
  alias du="du -h"
fi

if darwin; then
  alias e="mvim"
  alias o="open"
  alias r="open -R"

  alias c="pbcopy"
  alias p="pbpaste"

  function man_() {
    man $* | col -b
  }

  alias gvim="mvim"
fi

if linux || freebsd; then
  alias xlock="xlock -mode rain"
  alias pdfopen="pdfopen --viewer xpdf"
  alias xclock="xclock -geometry 100x100-40+40"

  function my_open() {
    xdg-open $1 >/dev/null 2>/dev/null &
    disown $!
  }
  alias o="my_open"

  alias mvim="gvim"
fi
