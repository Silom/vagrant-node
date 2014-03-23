# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "nodebox-precise"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provision :shell, :path => "setup/bootstrap.sh"
  config.vm.synced_folder "project/", "/var/nodespace/project/"
  config.vm.synced_folder "resource/", "/var/nodespace/resource/"
end
