if [ "x$SSH_AGENT_PID" = x ]; then
  eval `ssh-agent`
fi
