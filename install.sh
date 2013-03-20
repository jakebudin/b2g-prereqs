#! /bin/bash

sudo apt-get install autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev make zip -y
sudo apt-get upgrade -y

sudo apt-get update -y

sudo ln -s /usr/lib/i386-linux-gnu/libX11.so.6 /usr/lib/i386-linux-gnu/libX11.so
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 10 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 5 -y
sudo update-alternatives --config gcc -1

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.7 10 -y
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 5 -y
sudo update-alternatives --config g++ -1

echo "I barely know what I am doing"

# What Linux distro are we on?
OS= sed -n 's/^MINT=//p' /etc/*-release
echo $OS

sudo apt-get install gcc -y
# yum install gcc -y

sudo apt-get install ccache -y
ccache --max-size 3GB

git clone git://github.com/mozilla-b2g/B2G.git
cd B2G/
./config.sh emulator

echo "export CC=`which gcc-4.6`" > B2G/.userconfig
echo "export CXX=`which g++-4.6`" >> B2G/.userconfig

echo "export CC=`which gcc-4.6`"

git pull -y
./repo sync

sudo apt-get update
# use your username instead of jbeast ***
cp /home/jbeast/b2g-prereqs/B2G/.repo/repo/repo /home/jbeast/b2g-prereqs/B2G/repo

./build.sh

exit 0


