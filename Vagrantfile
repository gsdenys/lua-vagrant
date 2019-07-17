# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.4.3"

source = ""
memory = 4096
version = "1.2.1"
cpus = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vb|
    vb.name = "vagrant_lua"
    vb.memory = memory
    vb.cpus = cpus
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/ — timesync-set-threshold", 10000]
  end
  
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder source, "/lua"

  for i in 8080..9999
    config.vm.network :forwarded_port, guest: i, host: i
  end

  config.vm.provision "shell", path: "provision.sh"
end
