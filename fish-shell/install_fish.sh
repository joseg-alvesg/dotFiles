# check if i in arch or deb
if [ -f /etc/debian_version ]; then
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt-get update
    sudo apt-get install fish
elif [ -f /etc/arch-release ]; then
    sudo pacman -Syy --needed --noconfirm git neovim which fish 
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
    chmod +x ./install
    fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf
    sudo chsh -s $(which fish) 
    rm ./install
fi
mkdir -p $OMF_CONFIG/config.d/
mkdir -p $OMF_CONFIG/functions/

fish -c "omf install https://github.com/joseg-alvesg/theme-agnoster-fork  "
mv $OMF_PATH/pkg/agnoster-fork $OMF_PATH/themes/

fish -c "omf install fish-spec bak foreign-env config nvm ssh-config.d"

cp ~/dotFiles/fish-shell/config.fish $OMF_CONFIG/config.fish
cp -r ~/dotFiles/fish-shell/config.d/* $OMF_CONFIG/config.d/
cp -r ~/dotFiles/fish-shell/functions/* $OMF_CONFIG/functions/

fish
