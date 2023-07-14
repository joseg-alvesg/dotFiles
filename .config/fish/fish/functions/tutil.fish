function tutil --wraps='tmux -ADs utils' --wraps='tmux new -ADs utils' --description 'alias tutil=tmux new -ADs utils'
  tmux new -ADs utils $argv
        
end
