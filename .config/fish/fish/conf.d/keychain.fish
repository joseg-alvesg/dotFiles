if status is-interactive
  # To add a key, set -Ua SSH_KEYS_TO_AUTOLOAD keypath
  # To remove a key, set -U --erase

  if begin
    set -gx SSH_AGENT_PID (pgrep -u $USER ssh-agent)
    and kill -0 $SSH_AGENT_PID
    and grep -q '^ssh-agent' /proc/$SSH_AGENT_PID/cmdline
  end
    bash ~/scripts/ssh_agent
  else
  end
end
