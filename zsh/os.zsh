darwin() {
  uname | grep Darwin > /dev/null
}

freebsd() {
  uname | grep FreeBSD > /dev/null
}

linux() {
  uname | grep Linux > /dev/null
}

bsd() {
  freebsd || darwin
}

wsl() {
  [ -e /proc/version ] && grep -q Microsoft /proc/version
}
