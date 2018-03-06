autoload -z edit-command-line
zle -N edit-command-line
bindkey -e
bindkey "^X^E" edit-command-line

# http://grml.org/zsh-pony/#sec-10-5
slash-backward-kill-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N slash-backward-kill-word
bindkey '\e^?' slash-backward-kill-word
# key: alt-backspace

if linux; then
  bindkey "^[[1;3C" forward-word
  bindkey "^[[1;3D" backward-word
fi
