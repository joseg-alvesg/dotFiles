sudo apt update && sudo apt-get install git cmake build-essential \
    libgcrypt20-dev libyajl-dev libboost-all-dev libcurl4-openssl-dev \
    libexpat1-dev libcppunit-dev binutils-dev \
    debhelper zlib1g-dev dpkg-dev pkg-config \
    libsvn-dev libapache2-mod-svn subversion-tools -y

git clone https://github.com/vitalif/grive2.git && cd grive2
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd $HOME && mkdir -p /clouds/drive && cd /clouds/drive
grive -a
cd $HOME
svn export https://github.com/joseg-alvesg/dotFiles/trunk/home/scripts
