Vagrant.configure("2") do |config|

	config.vm.box = "debian/jessie64"

	config.vm.network "private_network", ip: "192.168.33.10" # http://192.168.33.10/

	config.vm.synced_folder "./public", "/var/www/html"

	config.vm.provider "virtualbox" do |vb|
		vb.name = "debian_jessie64"
		vb.memory = "1024"
		vb.cpus = 1
	end

	config.ssh.insert_key = false

	config.vm.provision :shell, keep_color: true, path: "bootstrap.sh"

end
