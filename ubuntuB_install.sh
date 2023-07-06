OMF_PATH=~/.local/share/omf
OMF_CONFIG=~/.config/omf
FISH_CONFIG=~/.config/fish

cd $HOME
  sudo apt update && sudo apt install -y curl git
  wget https://launchpad.net/~fish-shell/+archive/ubuntu/release-3/+files/fish_3.6.1-1~jammy_amd64.deb
  sudo dpkg -i fish_3.6.1-1~jammy_amd64.deb
  rm fish_3.6.1-1~jammy_amd64.deb
  sudo apt install -yf

git clone https://github.com/joseg-alvesg/dotFiles.git $HOME --depth 1 && cd $HOME/dotFiles

for i in post-install.txt ; do
  sudo apt install -y $i
    if [ $? -ne 0 ]; then
        echo $i >> $HOME/dotFiles/uninstalleds.txt
    fi
done

bash $HOME/dotFiles/install.sh

