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
  RPS1="%n@%M"
}

short() {
  set_PS1 "%1~ $ "
}

long
