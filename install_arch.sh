cd $HOME
git clone https://github.com/joseg-alvesg/dotFiles.git --depth=1 && cd $HOME/dotFile

# Install yay
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

for i in $(cat ./post-install.txt); do
  if ! yay -Qi &> /dev/null; then
    sudo pacman -Syy --needed --noconfirm $i
  elif yay -Qi &> /dev/null; then
    yay -S --noconfirm $i
fi
