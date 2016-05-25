autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst

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
