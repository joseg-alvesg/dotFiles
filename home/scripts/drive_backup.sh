#!/usr/bin/env sh

# Variables
home_dir="/home/$(whoami)"
backup_dir="/home/$(whoami)/backup"
dot_files_backup="/home/$(whoami)/backup/dotFiles"
home_backup="/home/$(whoami)/backup/home"
local_backup="/home/$(whoami)/backup/home/local/home/share"
drive_path="/home/$(whoami)/clouds/drive"
log_path="/home/$(whoami)/scripts/log"
date_format=$(date +%d-%m-%Y)
backup_file="backup_$date_format.tar"

# Create backup directories
mkdir -p "$backup_dir" "$dot_files_backup" "$home_backup" "$local_backup"

copy_dot_files() {
  config_dir="$home_dir/.config"
  dot_files=("nvim" "alacritty" "autostart" "bspwm" "dunst" "polybar" "rofi" "coc" "lvim" "neofetch" "redshift" "sxhkd" "fish")

  for file in "${dot_files[@]}"; do
    cp -Rv "$config_dir/$file" "$dot_files_backup"
  done

  cp -Rv "$config_dir/mimeapps.list" "$dot_files_backup"
  cp -v "$config_dir/picom.conf" "$dot_files_backup"
  cp -v "$home_dir/.tmux.conf" "$dot_files_backup"
  cp -v "$home_dir/.xinitrc" "$dot_files_backup"
  cp -Rv "$home_dir/scripts/" "$dot_files_backup"
}

copy_home_files() {
  home_files=("Documentos" "Imagens" "scripts" "poesias")

  for file in "${home_files[@]}"; do
    cp -Rv "$home_dir/$file" "$home_backup"
  done

  cp -Rv "$home_dir/.local/share/fonts/" "$local_backup"
  cp -Rv "$home_dir/.local/share/applications/" "$local_backup"
}

# Copy dot dot_files
copy_dot_files

# Copy home files
copy_home_files

printf "Backup realizado com sucesso em $date_format" >> "$log_path"
if tar -cf - "$backup_dir/" | pv -s $(du -sb "$backup_dir/" | awk '{print $1}') | gzip > "$drive_path/backup/$backup_file"; then
    cd "$drive_path" && grive
    printf "Backup realizado com sucesso em $date_format" >> "$log_path"
    dunstify -u normal -t 7000 -i "$home/.config/dunst/icons/backup.png" "Backup realizado com sucesso em $date_format"
else
    printf "Erro ao realizar backup em $date_format" >> "$log_path"
fi

# Remove backup file
rm -rf "$home_backup"

# remove old backup drivre
find "$drive_path/backup" -mtime +30 -delete
