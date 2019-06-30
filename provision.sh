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
sudo -E apt-get install -y gcc g++
sudo -E apt-get install -y lua5.1 luarocks
