function dot_files --description 'copy the files i need to $HOME/dotFiles/'
  # create dirs if they dont exist
  mkdir -p $HOME/dotFiles/fish-shell/functions/
  mkdir -p $HOME/dotFiles/fish-shell/conf.d/
  mkdir -p $HOME/dotFiles/vim_confs/nvim/
  mkdir -p $HOME/dotFiles/vim_confs/lvim/
  mkdir -p $HOME/dotFiles/bspwm/
  mkdir -p $HOME/dotFiles/polybar/
  mkdir -p $HOME/dotFiles/sxhkd/
  mkdir -p $HOME/dotFiles/alacritty/
  mkdir -p $HOME/dotFiles/tmux/
  mkdir -p $HOME/dotFiles/rofi/

  # copy the files from fish
  cp -rv $HOME/.config/fish/* $HOME/dotFiles/fish-shell/

  # copy the files from nvim
  cp -rv $HOME/.config/nvim/* $HOME/dotFiles/vim_confs/nvim

  # copy the files from lvim
  cp -rv $HOME/.config/lvim/ $HOME/dotFiles/vim_confs/lvim

  # copy files from bspwm
  cp -rv $HOME/.config/bspwm/* $HOME/dotFiles/bspwm
  
  # copy files from polybar
  cp -rv $HOME/.config/polybar/* $HOME/dotFiles/polybar

  # copy files from sxhkd
  cp -rv $HOME/.config/sxhkd/* $HOME/dotFiles/sxhkd

  # copy files from alacritty
  cp -rv $HOME/.config/alacritty/* $HOME/dotFiles/alacritty
  rm -rf $HOME/dotFiles/alacritty/themes/.git/
  
  # copy files from tmux
  cp -rv $HOME/.tmux.conf $HOME/dotFiles/tmux

  # copy files from rofi
  cp -rv $HOME/.config/rofi/* $HOME/dotFiles/rofi

  echo "pushing dotFiles to github"
  cd $HOME/dotFiles
  if test -z $argv
    git add --all
    git commit -m update
  else
    git add --all
    git commit -m $argv
  end
  git push

  cp -rv $HOME/.local/share/omf/themes/agnoster/* $HOME/personal-proj/theme-agnoster-fork/

  echo "pushing agnoster theme to github"
  cd $HOME/personal-proj/theme-agnoster-fork/
  if test -z $argv
    git add --all
    git commit -m update
  else
    git add --all
    git commit -m $argv
  end
  git push

  cd $HOME
end

