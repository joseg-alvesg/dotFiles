function ssh_agent
    killall ssh-agent
    eval (ssh-agent -c)
    for key_path in $SSH_KEYS_TO_AUTOLOAD
        if test -f $key_path
            ssh-add -k $key_path
        end
    end
end
