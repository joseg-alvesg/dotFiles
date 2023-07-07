OMF_PATH=~/.local/share/omf
OMF_CONFIG=~/.config/omf
FISH_CONFIG=~/.config/fish

#################################
# Install fish                 #
#################################

# clone and install
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
chmod +x ./install
fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf
sudo chsh -s $(which fish) 
rm -v ./install

# create folders if they don't exist
mkdir -p $FISH_CONFIG
mkdir -p $FISH_CONFIG/config.d/
mkdir -p $FISH_CONFIG/functions/

# install my fork theme
fish -c "omf install https://github.com/joseg-alvesg/theme-agnoster-fork"
mv -v $OMF_PATH/pkg/agnoster-fork $OMF_PATH/themes/

# install plugins
fish -c "omf install fish-spec bak foreign-env config nvm ssh-config.d"

# copy config files
cp -aRv $HOME/dotFiles/fish-shell/config.fish $FISH_CONFIG/config.fish
cp -aRv $HOME/dotFiles/fish-shell/config.d/* $FISH_CONFIG/config.d/
cp -aRv $HOME/dotFiles/fish-shell/functions/* $FISH_CONFIG/functions/

#################################
# Install lunarvim / neovim    #
#################################

# create folders if they don't exist
mkdir -p $HOME/.config/lvim
mkdir -p $HOME/.config/nvim

# copy config files
cp -aRv $HOME/dotFiles/vim_confs/lvim/* $HOME/.config/lvim/
cp -aRv $HOME/dotFiles/vim_confs/nvim/* $HOME/.config/nvim/

#################################
# Install bspwm                #
#################################

# create folders if they don't exist
mkdir -p $HOME/.config/bspwm/
mkdir -p $HOME/.config/sxhkd/
mkdir -p $HOME/.config/polybar/
mkdir -p $HOME/.config/rofi/
mkdir -p $HOME/.config/dunst/

# copy config files
cp -aRv $HOME/dotFiles/bspwm/* $HOME/.config/bspwm/
cp -aRv $HOME/dotFiles/sxhkd/* $HOME/.config/sxhkd/
cp -aRv $HOME/dotFiles/polybar/* $HOME/.config/polybar/
cp -aRv $HOME/dotFiles/rofi/* $HOME/.config/rofi/
cp -aRv $HOME/dotFiles/dunst/* $HOME/.config/dunst/
cp -aRv $HOME/dotFiles/picom/* $HOME/.config/

#################################
# install alacritty / tmux     #
#################################

# create folders if they don't exist
mkdir -p $HOME/.config/alacritty/fonts
mkdir -p $HOME/.config/alacritty/themes

# copy config files
cp -aRv $HOME/dotFiles/alacritty/* $HOME/.config/alacritty/
cp -aRv $HOME/dotFiles/tmux/* $HOME
