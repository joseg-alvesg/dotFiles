set -g REMIND_HOME "$HOME/.config/remind"
set -g REMIND_FILE "$REMIND_HOME/reminders.rem"
set -g FISH_USER_FUNCTIONS "$HOME/.config/fish/functions"
set -g FISH_USER_COMPLETIONS "$HOME/.config/fish/completions"
set -g FISH_USER_KEY_BINDINGS "$HOME/.config/fish/functions/fish_user_key_bindings.fish"
set -g FISH_USER_PROMPT "$HOME/.config/fish/functions/fish_prompt.fish"
set -g FISH_USER_CONFIG_DIR "$HOME/.config/fish/config.d"

if status is-interactive
  tmux new -A -s main
  neofetch
  set -g EDITOR lvim
end
