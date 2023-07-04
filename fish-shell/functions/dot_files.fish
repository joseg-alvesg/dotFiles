function dot_files --description 'copy the files i need to $HOME/dotFiles/'
  # create dirs if they dont exist
  echo "creating dirs"
  mkdir -p $HOME/dotFiles/fish-shell/functions/
  mkdir -p $HOME/dotFiles/fish-shell/conf.d/
  mkdir -p $HOME/dotFiles/fish-shell/themes/
  mkdir -p $HOME/dotFiles/vim_confs/nvim/
  mkdir -p $HOME/dotFiles/vim_confs/lvim/
  mkdir -p $HOME/dotFiles/bspwm/
  mkdir -p $HOME/dotFiles/polybar/
  mkdir -p $HOME/dotFiles/sxhkd/
  echo "done creating dirs"

  # copy the files from fish
  echo "copying files from: fish"
  cp -r $HOME/.config/fish/functions $HOME/dotFiles/fish-shell/
  cp -r $HOME/.config/fish/conf.d/ $HOME/dotFiles/fish-shell/
  cp -r $HOME/.config/fish/ $HOME/dotFiles/fish-shell/
  cp -r $HOME/.config/fish/ $HOME/dotFiles/fish-shell/

  echo "themes"
  cp -r $HOME/.local/share/omf/themes/agnoster/ $HOME/dotFiles/fish-shell/themes/
  echo "done copying files from fish"

  # copy the files from nvim
  echo "copying files from: nvim "
  cp -r $HOME/.config/nvim/ $HOME/dotFiles/vim_confs/nvim

  # copy the files from lvim
  echo "lvim"
  cp -r $HOME/.config/lvim/ $HOME/dotFiles/vim_confs/lvim
  echo "done copying files from vim"

  # copy files from bspwm
  echo "copying files from: bspwm"
  cp -r $HOME/.config/bspwm/ $HOME/dotFiles/bspwm
  
  # copy files from polybar
  echo "polybar"
  cp -r $HOME/.config/polybar/ $HOME/dotFiles/polybar

  # copy files from sxhkd
  echo "sxhkd"
  cp -r $HOME/.config/sxhkd/ $HOME/dotFiles/sxhkd
  echo "done copying files from bspwm"

  cd $HOME/dotFiles
  git add .
  git commit -m "update $(date)"
  git push
end
