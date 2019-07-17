#!/bin/bash

set -o errexit

# Suppress some warnings
export DEBIAN_FRONTEND=noninteractive
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Fix locale warning
sudo echo "LC_CTYPE=\"en_US.UTF-8\"" >> /etc/default/locale
sudo echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

# Set locale
echo "export LC_ALL=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LC_CTYPE=en_US.UTF-8" >> /home/vagrant/.bashrc

# Assign permissions to "vagrant" user
sudo chown -R vagrant /usr/local

sudo -E apt-get update
sudo -E apt-get -y upgrade
sudo -E apt-get install -qq gcc g++ 
sudo -E apt-get install -qq httpie jq
sudo -E apt-get install -qq git curl make cmake pkg-config unzip apt-transport-https language-pack-en libssl-dev m4 cpanminus

#install openssl
wget https://www.openssl.org/source/openssl-1.1.1.tar.gz
tar xvf openssl-1.1.1.tar.gz
cd openssl-1.1.1
sudo ./config -Wl,--enable-new-dtags,-rpath,'$(LIBRPATH)'
sudo make
sudo make install
cd ..
rm -rf openssl-1.1.1*

#install luarocks and Luajit
git clone https://github.com/torch/luajit-rocks.git
cd luajit-rocks
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/luarocks
sudo make install
cd ../../
rm -rf luajit-rocks

sudo chown -R vagrant /opt/luarocks
ln -s /opt/luarocks/bin/luajit /opt/luarocks/bin/lua

# Adjust PATH for future SSH
echo "export PATH=/usr/local/bin:/opt/luarocks/bin:\$PATH:" >> /home/vagrant/.bashrc
# Do the same for root so we access to profiling tools
echo "export PATH=/usr/local/bin:/opt/luarocks/bin:\$PATH" >> /root/.bashrc
