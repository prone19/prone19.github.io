# -*- mode: ruby -*-
# vi: set ft=ruby :

# Single ubuntu-arm box for vmware provider (apple silicon compatible)
# 
# NOTE that without the following it may not start up:
# vmware.allowlist_verified = true
# vmware.vmx["ethernet0.pcislotnumber"] = "160"
# vmware.gui = true' 

Vagrant.configure("2") do |config|
    config.vm.box = "spox/ubuntu-arm"
    config.vm.box_version = "1.0.0"
    config.ssh.port = 2222
    config.vm.network "forwarded_port", guest: 80, host: 80, id: "nginx"
    
    config.vm.provider :vmware_desktop do |vmware|
        vmware.gui = true
        #vmware.allowlist_verified = true
        #vmware.vmx["ethernet0.pcislotnumber"] = "160"
    end
    config.vm.provision "shell", path: "scripts/install-docker.sh"
    config.vm.provision "shell", path: "scripts/install-nginx.sh"
    config.vm.provision "shell", path: "scripts/configure-sshd.sh"
    config.vm.provision "file", source: "./scripts/userlist", destination: "/tmp/userlist"
    config.vm.provision "shell", path: "scripts/add-users.sh"
end