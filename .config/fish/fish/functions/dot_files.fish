function dot_files --description 'copy the files i need to $HOME/dotFiles/'
  # create dirs if they dont exist
  mkdir -p $HOME/dotFiles/.config/

  # copy files
  cp -Rv $HOME/.config/nvim/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/alacritty/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/autostart/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/bspwm/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/dunst/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/polybar/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/rofi/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/coc/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/lvim/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/neofetch/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/redshift/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/sxhkd/ $HOME/dotFiles/.config/
  cp -Rv $HOME/.config/fish/ $HOME/dotFiles/.config/fish/
  cp -v $HOME/.config/picom.conf $HOME/dotFiles/.config/


  # echo "pushing dotFiles to github"
  # cd $HOME/dotFiles
  # if test -z $argv
  #   git add --all
  #   git commit -m update
  # else
  #   git add --all
  #   git commit -m $argv
  # end
  # git push
end

