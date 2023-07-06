if status is-interactive
  tmux new -A -s main
  neofetch
  set -g EDITOR lvim
end
