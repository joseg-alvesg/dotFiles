function tns --wraps='tmux new -A -s' --description 'alias tns=tmux new -A -s'
  tmux new -A -s $argv
        
end
