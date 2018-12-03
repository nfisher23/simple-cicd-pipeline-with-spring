Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.56.121"

  # 4 gigs of memory
  config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 1
  end

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "shell", inline: "cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys"
  config.vm.provision "shell", inline: "mkdir -p /root && mkdir -p /root/.ssh/ && cat /home/vagrant/.ssh/me.pub >> /root/.ssh/authorized_keys"

  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/playbook.yml"
  end

end