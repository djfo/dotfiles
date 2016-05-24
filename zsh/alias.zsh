alias g="git"
alias vi="vim"

case `uname` in
  Linux)
    alias ls="ls -F1 --color=auto"
    alias lc="ls -FC --color=auto"
    alias ll="ls -Fl --color=auto"
    ;;
  Darwin)
    alias ls="ls -GF1"
    alias lc="ls -GFC"
    alias ll="ls -GFlh"

    alias e="mvim"
    alias o="open"
    alias r="open -R"
    ;;
esac
