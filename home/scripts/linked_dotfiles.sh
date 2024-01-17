#!/usr/bin/env bash

conf_dir="$HOME/.config"
dot_dir="$HOME/dotFiles"

# Create config directory if it doesn't exist
if [ ! -d "$conf_dir" ]; then
    mkdir "$conf_dir"
fi

# link the dotfiles repo to the home directory
dot_home="$dot_dir/home"
dot_home_files=$(ls "$dot_home")

for file in $dot_home_files; do
  # check if the file exists then remve
  if [ -L "$HOME/$file" ]; then
    echo "Removing existing old $file"
    unlink "$HOME/$file"
  elif [ ! -L "$HOME/$file" ]; then
    echo "removing existing old $file"
    rm -rf "$HOME/$file"
  else 
    echo "Skipping $file"
  fi
  # link the files
  if [ -f "$dot_home/$file" ]; then
    echo "Linking FILE $file"
    ln -s "$dot_home/$file" "$HOME/"
  elif [ -d "$dot_home/$file" ]; then
    echo "Linking DIR $file"
    ln -s "$(realpath "$dot_home/$file/")" "$HOME/"
  else
    echo "Skipping unknoun type $file"
  fi
done

# link the dotfiles repo to the config directory
dot_config="$dot_dir/config"
dot_config_files=$(ls "$dot_config")

for file in $dot_config_files; do
  # check if the file exists then remve
  if [ -L "$conf_dir/$file" ]; then
    echo "Removing existing old $file"
    unlink "$conf_dir/$file"
  elif [ ! -L "$conf_dir/$file" ]; then
    echo "removing existing old $file"
    rm -rf "$conf_dir/$file"
  else 
    echo "Skipping $file"
  fi
  # link the files
  if [ -f "$dot_config/$file" ]; then
    echo "Linking FILE $file"
    ln -s "$dot_config/$file" "$conf_dir/"
  elif [ -d "$dot_config/$file" ]; then
    echo "Linking DIR $file"
    ln -s "$(realpath "$dot_config/$file/")" "$conf_dir/"
  else
    echo "Skipping unknoun type $file"
  fi
done
