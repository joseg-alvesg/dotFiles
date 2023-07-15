if pgrep -x "ssh-agent" > /dev/null
    set -gx SSH_AUTH_SOCK (find /tmp/ssh-* -name "agent.*" -user $USER -print -quit)
    set -gx SSH_AGENT_PID (pgrep -x "ssh-agent")
else
    eval (ssh-agent -c)
    for key_path in $SSH_KEYS_TO_AUTOLOAD
        if test -f $key_path
            ssh-add -k $key_path
        end
    end
end
