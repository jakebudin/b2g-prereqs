#! /bin/bash

sudo apt-get install autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev make zip -y
sudo apt-get upgrade -y

sudo apt-get update -y

echo "I barely know what I am doing"

# What Linux distro are we on?
OS= sed -n 's/^UBUNTU=//p' /etc/*-release
echo $OS

sudo apt-get install gcc -y
# yum install gcc -y

echo "export CC=`which gcc-4.6`" > B2G/.userconfig
echo "export CXX=`which g++-4.6`" >> B2G/.userconfig

echo "export CC=`which gcc-4.6`"

ccache --max-size 3GB

git clone git://github.com/mozilla-b2g/B2G.git
cd B2G/
./config.sh emulator

git pull
./repo sync

./build.sh

exit 0


