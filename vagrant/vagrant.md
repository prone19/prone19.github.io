# Vagrant

[Back to HOME](https://prone19.github.io/)


The [Vagrantfile](Vagrantfile) is deploying Ubuntu 20.04 and
* installing docker 
* installing nginx
* making ssh access by key only
* adding users without sudo; with docker group (list of users is in userlist)

## Getting started
1. Install Vagrant on your machine ... TBU
2. Install a provider (e.g. VMware fusion). See [https://www.vagrantup.com/docs/providers/vmware](https://www.vagrantup.com/docs/providers/vmware)
2. Run ```vagrant up``` being in the directory with the Vagrantfile
3. To stop run ```vagrant halt```. To restore the state use ```vagrant destroy```.
4. To remove the box see [https://www.vagrantup.com/docs/cli/box#box-remove](https://www.vagrantup.com/docs/cli/box#box-remove)

Sources:
[https://github.com/hashicorp/vagrant/issues/7656](https://github.com/hashicorp/vagrant/issues/7656)
[https://superuser.com/questions/161609/can-someone-explain-the-passwordauthentication-in-the-etc-ssh-sshd-config-fil/374234#374234](https://superuser.com/questions/161609/can-someone-explain-the-passwordauthentication-in-the-etc-ssh-sshd-config-fil/374234#374234)
[http://novosial.org/openssh/publickey-auth/index.html](http://novosial.org/openssh/publickey-auth/index.html)
[https://github.com/patrickdlee/vagrant-examples/blob/master/example4/Vagrantfile](https://github.com/patrickdlee/vagrant-examples/blob/master/example4/Vagrantfile)