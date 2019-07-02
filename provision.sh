#!/bin/bash

set -o errexit

# Suppress some warnings
export DEBIAN_FRONTEND=noninteractive
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1



echo "*************************************************************************"
echo "Installing Lua version: $LUA_VERSION"
echo "*************************************************************************"


sudo chown -R vagrant /usr/local


sudo -E apt-get update
sudo -E apt-get -y upgrade
sudo -E apt-get install -qq gcc g++
sudo -E apt-get install -qq httpie jq
sudo -E apt-get install -qq git curl make pkg-config unzip apt-transport-https language-pack-en libssl-dev m4 cpanminus
sudo -E apt-get install -qq lua5.1 luarocks luajit


# Adjust PATH for future SSH
echo "export PATH=/usr/local/bin:/usr/local/openresty/bin:/opt/stap/bin:/usr/local/stapxx:/usr/local/openresty/nginx/sbin:/usr/local/openresty/luajit/bin:\$PATH:" >> /home/vagrant/.bashrc

# Do the same for root so we access to profiling tools
echo "export PATH=/usr/local/bin:/usr/local/openresty/bin:/opt/stap/bin:/usr/local/stapxx:/usr/local/openresty/nginx/sbin:/usr/local/openresty/luajit/bin:\$PATH" >> /root/.bashrc
# Set locale
echo "export LC_ALL=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LC_CTYPE=en_US.UTF-8" >> /home/vagrant/.bashrc

# Fix locale warning
sudo echo "LC_CTYPE=\"en_US.UTF-8\"" >> /etc/default/locale
sudo echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

# Assign permissions to "vagrant" user
sudo chown -R vagrant /usr/local
