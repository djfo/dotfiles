autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:*' actionformats \
  '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

set_PS1() {
  env | grep SSH_CLIENT > /dev/null
  if [ $? -eq 0 ]; then
    # Color prompt red if connected over ssh.
    PS1="%B%{$fg[red]%}$1%{$fg[default]%}%b"
  else
    PS1="$1"
  fi
}

long() {
  set_PS1 "%~ $ "
  RPS1="\$vcs_info_msg_0_%n@%m"
}

short() {
  set_PS1 "%1~ $ "
  unset RPS1
}

long
