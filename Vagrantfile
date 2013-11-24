Vagrant.configure("2") do |config|
  
	config.vm.box = "precise32"

	#config.vm.box_url = "http://files.vagrantup.com/precise32.box"

	config.vm.network :forwarded_port, guest: 80, host: 8080
  	config.vm.network :forwarded_port, guest: 3306, host: 3306
  	config.vm.network :forwarded_port, guest: 5432, host: 5432

	config.vm.provision :shell, :path => "install.sh"

	config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=755","fmode=755"]

end
