function tmain --wraps='tmux new -as main' --wraps='tmux new -a -a main' --wraps='tmux new -a -s main' --wraps='tmux new -As main' --wraps='tmux new -ADs main' --description 'alias tmain=tmux new -ADs main'
  tmux new -ADs main $argv
        
end
