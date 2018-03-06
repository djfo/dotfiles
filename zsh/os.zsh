function darwin() {
  uname | grep Darwin > /dev/null
}

function freebsd() {
  uname | grep FreeBSD > /dev/null
}

function linux() {
  uname | grep Linux > /dev/null
}

function bsd() {
  freebsd || darwin
}
