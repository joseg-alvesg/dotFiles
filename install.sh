OMF_PATH=~/.local/share/omf
OMF_CONFIG=~/.config/omf
FISH_CONFIG=~/.config/fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
chmod +x ./install
fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf
sudo chsh -s $(which fish) 
rm -v ./install

mkdir -p $FISH_CONFIG
mkdir -p $FISH_CONFIG/config.d/
mkdir -p $FISH_CONFIG/functions/

fish -c "omf install https://github.com/joseg-alvesg/theme-agnoster-fork"
mv -v $OMF_PATH/pkg/agnoster-fork $OMF_PATH/themes/

fish -c "omf install fish-spec bak foreign-env config nvm ssh-config.d"

cp -v ~/dotFiles/fish-shell/config.fish $FISH_CONFIG/config.fish
cp -rv ~/dotFiles/fish-shell/config.d/* $FISH_CONFIG/config.d/
cp -rv ~/dotFiles/fish-shell/functions/* $FISH_CONFIG/functions/

fish
