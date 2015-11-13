# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure a minimum Vagrant version to prevent potential issues.
Vagrant.require_version '>= 1.5.0'

# Configure using Vagrant's version 2 API/syntax.
Vagrant.configure(2) do |config|
  # Ubuntu 14.04, 64 bit
  config.vm.box         = 'bento/ubuntu-14.04'
  config.vm.box_version = '2.2.2'

  # Providers
  config.vm.provider :virtualbox do |p|
    p.customize ['modifyvm', :id, '--memory', '1024']
  end

  # SSH
  config.ssh.username = 'vagrant'

  # Port Forwarding
  config.vm.network :forwarded_port, guest: 9021, host: 9021
  config.vm.network :forwarded_port, guest: 9083, host: 9083
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Provisioning
  config.vm.provision :shell do |sh|
    sh.inline = <<-EOF
      apt-get install wget -y
      wget http://emr.ge/dist/ubuntu/quickinstall-14.04.sh -O - | sudo sh
    EOF
  end
end
