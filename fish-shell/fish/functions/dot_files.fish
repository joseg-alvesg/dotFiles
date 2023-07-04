function dot_files --description 'copy the files i need to $HOME/dotFiles/'
  # create dirs if they dont exist
  mkdir -p $HOME/dotFiles/fish-shell/functions/
  mkdir -p $HOME/dotFiles/fish-shell/conf.d/
  mkdir -p $HOME/dotFiles/vim_confs/nvim/
  mkdir -p $HOME/dotFiles/vim_confs/lvim/
  mkdir -p $HOME/dotFiles/bspwm/
  mkdir -p $HOME/dotFiles/polybar/
  mkdir -p $HOME/dotFiles/sxhkd/
  echo "done creating dirs"

  # copy the files from fish
  cp -rv $HOME/.config/fish/functions $HOME/dotFiles/fish-shell/
  cp -rv $HOME/.config/fish/conf.d/ $HOME/dotFiles/fish-shell/
  cp -rv $HOME/.config/fish/ $HOME/dotFiles/fish-shell/
  cp -rv $HOME/.config/fish/ $HOME/dotFiles/fish-shell/
  echo "fish copy done"

  # copy the files from nvim
  cp -rv $HOME/.config/nvim/ $HOME/dotFiles/vim_confs/nvim
  echo "nvim done"

  # copy the files from lvim
  cp -rv $HOME/.config/lvim/ $HOME/dotFiles/vim_confs/lvim
  echo "lvim done"

  # copy files from bspwm
  cp -rv $HOME/.config/bspwm/ $HOME/dotFiles/bspwm
  echo "bspwm done"
  
  # copy files from polybar
  cp -rv $HOME/.config/polybar/ $HOME/dotFiles/polybar
  echo "polybar done"

  # copy files from sxhkd
  cp -rv $HOME/.config/sxhkd/ $HOME/dotFiles/sxhkd
  echo "sxhkd done"

  cd $HOME/dotFiles
  if test -z $argv
    git commit -am update
  else
    git commit -am $argv
  end
  git push
  echo "pushed dotFiles"

  cp -rv $HOME/.local/share/omf/themes/agnoster/ $HOME/personal-proj/theme-agnoster-fork/
  echo "agnoster theme"

  cd $HOME/personal-proj/theme-agnoster-fork/
  pwd
  if test -z $argv
    git commit -am update
  else
    git commit -am $argv
  end
  git push
  echo "pushed agnoster theme"
end
