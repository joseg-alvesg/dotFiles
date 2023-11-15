# left colors for agnoster
set -g color_dir_bg 3A0046
set -g color_dir_str fff
set -g color_virtual_env_bg 290131
set -g color_virtual_env_str fff
set -g color_git_dirty_bg 110014
set -g color_git_dirty_str fff
set -g color_git_bg 88628F
set -g color_git_str fff

# right colors for agnoster
set -g color_vi_mode_indicator fff
set -g color_vi_mode_normal AA03C7
set -g color_vi_mode_insert 3A0046
set -g color_vi_mode_visual D900FF

if status is-interactive
  # neofetch
  set -g EDITOR lvim
  set -g fish_greeting ""
end
