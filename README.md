# Shipping Challenge Linux

## My Vagrantfile
```bash
$script = <<-'SCRIPT'
git clone https://github.com/mstruyf/ms_shippingchallenge.git
cd ms_shippingchallenge
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "gunnix/ubuntu_server_20.04.1_LTS"
  config.vm.box_version = "0.0.1"
  config.vm.network "private_network", ip:"192.168.56.5"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.provider :virtualbox do |vb|
        vb.name = "Vagrant shipchallenge"
        vb.memory = 2048
        vb.cpus = 1
  end

  # install Docker
  config.vm.provision :docker
  # require plugin https://github.com/leighmcculloch/vagrant-docker-compose
  config.vagrant.plugins = "vagrant-docker-compose"
  # install Docker-compose
  config.vm.provision :docker_compose
  config.vm.provision "shell", inline: $script
end
```
