VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box     = "centos65-x86_64-20140116"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.hostname = "instasatis.local.dev"

  config.vm.network :private_network, ip: "192.168.56.10"

  config.vm.synced_folder "./synced", "/synced"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "./files/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

end

# If you have `vagrant up`ed the machine and just want to run salt again, super useful:
# time sudo salt-call state.highstate --local -l debug 2>&1 | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; }'