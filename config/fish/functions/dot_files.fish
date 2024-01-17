function dot_files --description 'copy the files i need to $HOME/dotFiles/'
  # vars
  echo "copying files to $HOME/dotFiles/"
  set home /home/$(whoami)/.config
  echo $home
  set config_path /home/$(whoami)/dotFiles/.config
  echo $config_path
  set home_path /home/$(whoami)/dotFiles/home
  echo $home_path
  set config_files "nvim" "alacritty" "autostart" "bspwm" "dunst" "polybar" "rofi" "coc" "lvim" "neofetch" "redshift" "sxhkd" "fish" "picom.conf"
  echo $config_files
  set home_files ".tmux.conf" ".xinitrc" "scripts"
  echo $home_files


  # create dirs if they dont exist
  mkdir -p $config_path
  mkdir -p $home_path

  # copy files
  for file in $config_files
    echo $file
    cp -Rv $home/$file $config_path
  end

  for file in $home_files
    echo $file
    cp -Rv $HOME/$file $home_path
  end

  dunstify -r 1 "dotFiles" "copied files to $HOME/dotFiles/"
end

