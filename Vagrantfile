Vagrant.configure("2") do |config|
  
  config.vm.box = "precise64"

	config.vm.box_url = "http://files.vagrantup.com/precise64.box"

	config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--vram", 256]
        vb.customize ["modifyvm", :id, "--name", "dev"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

	config.vm.network :forwarded_port, guest: 80, host: 8080
	config.vm.network :forwarded_port, guest: 3306, host: 3306
	config.vm.network :forwarded_port, guest: 5432, host: 5432

	config.vm.network :private_network, ip: "192.168.33.10"

	config.vm.provision :shell, :path => "install.sh"

	config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", :nfs => true, :nfs_version => 4

end
