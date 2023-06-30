function ssh_agent
keychain --quiet --eval $SSH_KEYS_TO_AUTOLOAD | source
end
