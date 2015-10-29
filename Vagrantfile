# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "AppDemo"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box" # ruby 1.9.3 only for root
  config.vm.network :forwarded_port, :guest => 8080, :host => 9161
  config.vm.network :forwarded_port, :guest => 8000, :host => 8000
  config.vm.network :forwarded_port, guest: 22, host: 2224, id: 'ssh', auto_correct: true
  config.vm.network "private_network", ip: "192.168.50.11"
  config.vm.provider "virtualbox" do |v|
    v.customize ['modifyvm', :id, '--cpus', '2', '--memory', '3146']
  end
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision :shell do |shell|
    shell.path='appInstall.sh'
  end
end

