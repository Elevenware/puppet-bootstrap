# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |root_config|

  root_config.vm.define :agent do |config|
    config.vm.box = "centos-6.4-naked"
    config.vm.box_url = "https://www.dropbox.com/s/wr75apg2yeojvc6/centos-6.4-naked.box" 
    config.vm.network :private_network, ip: "192.168.33.10"
  end

  
end
