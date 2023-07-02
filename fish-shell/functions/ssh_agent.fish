function ssh_agent --description 'Starts ssh-agent and loads keys from 1Password'
  keychain --quiet --eval $SSH_KEYS_TO_AUTOLOAD | source
end
