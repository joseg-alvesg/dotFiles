# check if i in arch or deb
if [ -f /etc/debian_version ]; then
    sudo apt update
    sudo apt install -y git neovim curl wget
    wget https://launchpad.net/~fish-shell/+archive/ubuntu/release-3/+files/fish_3.6.1-1~jammy_amd64.deb
    sudo dpkg -i fish_3.6.1-1~jammy_amd64.deb
    rm fish_3.6.1-1~jammy_amd64.deb
    sudo apt install -yf
    sudo apt install -y fonts-powerline fish
elif [ -f /etc/arch-release ]; then
    sudo pacman -Syy --needed --noconfirm git neovim which fish powerline-fonts
fi

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
chmod +x ./install
fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf
sudo chsh -s $(which fish) 
rm ./install

OMF_PATH=~/.local/share/omf
OMF_CONFIG=~/.config/omf
FISH_CONFIG=~/.config/fish

mkdir -p $FISH_CONFIG/config.d/
mkdir -p $FISH_CONFIG/functions/

fish -c "omf install https://github.com/joseg-alvesg/theme-agnoster-fork"
mv -v $OMF_PATH/pkg/agnoster-fork $OMF_PATH/themes/

fish -c "omf install fish-spec bak foreign-env config nvm ssh-config.d"

cp ~/dotFiles/fish-shell/config.fish $FISH_CONFIG/config.fish
cp -r ~/dotFiles/fish-shell/config.d/* $FISH_CONFIG/config.d/
cp -r ~/dotFiles/fish-shell/functions/* $FISH_CONFIG/functions/

fish

