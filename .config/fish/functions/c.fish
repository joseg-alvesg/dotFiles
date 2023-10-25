function c --wraps='xclip -sel c < ' --description 'alias c=xclip -sel c < '
  xclip -sel c <  $argv
        
end
