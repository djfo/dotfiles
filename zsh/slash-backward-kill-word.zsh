# http://grml.org/zsh-pony/#sec-10-5
slash-backward-kill-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N slash-backward-kill-word
bindkey '\e^?' slash-backward-kill-word
# key: alt-backspace
