#! /bin/bash

sudo apt-get install autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev make zip
sudo apt-get upgrade

sudo apt-get update

echo "I barely know what I am doing"

# What Linux distro are we on?
OS= sed -n 's/^MINT=//p' /etc/*-release
echo $OS

sudo apt-get install gcc -y
# yum install gcc -y

ccache --max-size 3GB

git clone git://github.com/mozilla-b2g/B2G.git
cd B2G/
./config.sh emulator

echo "export CC=`which gcc-4.6`" > B2G/.userconfig
echo "export CXX=`which g++-4.6`" >> B2G/.userconfig

echo "export CC=`which gcc-4.6`"

git pull
./repo sync

sudo apt-get update
cp /home/jb/b2g-prereqs/B2G/.repo/repo/repo /home/jb/b2g-prereqs/B2G/repo

./build.sh

exit 0


