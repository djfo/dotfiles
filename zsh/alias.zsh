for cmd in rm cp mv; alias $cmd="$cmd -i"

alias g="git"
alias vi="vim"
alias d="darcs"

case `uname` in
  Linux)
    alias ls="ls -F1 --color=auto"
    alias lc="ls -FC --color=auto"
    alias ll="ls -Fl --color=auto"

    alias xlock="xlock -mode rain"

    function my_open() {
      xdg-open $1 >/dev/null 2>/dev/null &
      disown $!
    }
    alias o="my_open"
    ;;
  Darwin)
    alias ls="ls -GF1"
    alias lc="ls -GFC"
    alias ll="ls -GFlh"

    alias e="mvim"
    alias o="open"
    alias r="open -R"

    alias c="pbcopy"
    alias p="pbpaste"

    function man_() {
      man $* | col -b
    }
    ;;
esac
