cd $HOME
# Install dependencies
sudo pacman -S --needed --noconfirm git base-devel

# clone and install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
yay -Y --gendb
yay -Syu --noconfirm --devel

# clone dotFiles
cd $HOME
git clone https://github.com/joseg-alvesg/dotFiles.git --depth=1
cd $HOME/dotFiles

# include dependencies for lunarvim
for i in $(cat ./dependencies.txt); do
  if ! yay -Qi &> /dev/null; then
    sudo pacman -Syy --needed --noconfirm $i
  elif yay -Qi &> /dev/null; then
    yay -S --noconfirm $i
  fi
done

#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 18
nvm alias default 18

# install lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# call the install script from to copy the config files
bash install.sh
