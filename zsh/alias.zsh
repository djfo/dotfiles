for cmd in rm cp mv; alias $cmd="$cmd -i"

alias g="git"
alias k="kubectl"

if linux; then
  alias du="du --si"
  alias lc="ls -FC --color=auto"
  alias ll="ls -Fl --color=auto"
  alias ls="ls -F1 --color=auto"
fi

if bsd; then
  alias du="du -h"
  alias lc="ls -GFC"
  alias ll="ls -GFlh"
  alias ls="ls -GF1"
fi

if darwin; then
  alias gvim="mvim"
  alias o="open"
  alias r="open -R"
  alias say.de="say -v Anna"
  alias say.en_US="say"
  alias say.fr_CA="say -v Amélie"

  function man_() {
    man $* | col -b
  }

  case `uname -m` in
    arm64)
      alias brew.x64_86=/usr/local/bin/brew
      PATH=/opt/homebrew/bin:$PATH
      ;;
  esac
fi

if linux || freebsd; then
  function my_open() {
    xdg-open $1 >/dev/null 2>/dev/null &
    disown $!
  }

  alias mvim="gvim"
  alias o="my_open"
  alias pdfopen="pdfopen --viewer xpdf"
  alias xclock="xclock -geometry 100x100-40+40"
  alias xlock="xlock -mode rain"
fi
