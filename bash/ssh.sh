# color prompt red if connected via ssh

if env | grep SSH_CLIENT > /dev/null; then
	tmp="$PS1"
	PS1="\033[1;31m$tmp\033[0m"
fi
