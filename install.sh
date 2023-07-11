OMF_PATH=~/.local/share/omf
OMF_CONFIG=~/.config/omf
FISH_CONFIG=~/.config/fish

cd $HOME/dotFiles/
#################################
# Install fish                 #
#################################

# clone and omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
chmod +x ./install
fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf
rm -v ./install

# install my fork theme
fish -c "omf install https://github.com/joseg-alvesg/theme-agnoster-fork"
mv -v $OMF_PATH/pkg/agnoster-fork $OMF_PATH/themes/

# install plugins
fish -c "omf install fish-spec bak foreign-env config nvm ssh-config.d"

#################################
# Copy .config                  #
#################################
cp -Rv .config/ $HOME/

#################################
# Copy .xinitrc/.tmux.conf      #
#################################
cp -v home/.tmux $HOME/
cp -v home/.xinitrc $HOME/

#################################
# Copy local/fonts              #
# Update font cache             #
#################################
cp -Rv local/fonts/ $HOME/.local/share/
sudo fc-cache -fv && fc-cache -fv

