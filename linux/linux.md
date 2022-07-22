# Linux

## Commands:

Misc
```bash
uname -a 

lscpu # hardware

echo $PATH 

man -k time # k stands for keywords

whereid uptime 
locate uptime

ps # processes from your account
```

*Ctrl+Z* snooze a process (like ping)
*fg* command to go back to foreground

Users
```bash
sudo useradd -m kok 
sudo passwd kok
# -m creates home directory

sudo userdel -r kok

sudo usermod -aG sudo kok
# -a append, G group
sudo deluser kok sudo # remove from sudo users group

#-------
cd etc/skel # everything in this dir would be copied to each new user home directory


#-------
cat /etc/passwd # username:x-password:1001-id:1001-groupid:comment:home/directory:bin/bash-shell
cat /etc/shadow # passwords
cat /etc/group  # groups, sudo group can be find here

whoami 
who
w 		# same as who with more info
id kok  # check user groups and etc

su kok  # switch to user  kok

last    # login history

sudo su - # perform as the root user
```

Groups
```bash
sudo groupadd Programmers
sudo groupdel Programmers
```

SSH
```bash
shh-keygen # creating private and pub keys
ssh-keygen -b 2048 -t rsa -f ~/.ssh/sshkey -q -N "" # for automation

# --- copy to remote server ---
ssh-copy-id user@$SERVER_IP
# --- OR ---
sudo useradd -s /bin/bash -d /home/voytek/ -m voytek # adding user without sudo; for sudo add '-G sudo'
sudo mkdir /home/voytek/.ssh/
sudo chmod 0700 /home/voytek/.ssh/
echo "<Your SSH pub key>" >> /home/voytek/.ssh/authorized_keys

# --- disabling password login ---
sudo sed -i -E 's/#?PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo service ssh restart


```
# Provisioning
Docker installation 
```bash
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
echo "Installing Docker..."

# Install pre-requisites
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Adding the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adding the Docker repository to APT sources
# See available versions:
# https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Update the package database with the Docker packages from the newly added repo
sudo apt update

# Install Docker from the officinal repository
apt-cache policy docker-ce
sudo apt install docker-ce -y

# Ensure Docker it is enabled to start after reboot
sudo systemctl start docker
sudo systemctl enable docker

# Add CI user to the docker group so it can run docker
# sudo usermod -aG docker ciuser

# Testing it works
echo "Checking Docker service:"
sudo systemctl status docker

echo "Checking Docker version:"
sudo docker version

echo "Docker installed."
```

```bash
# Adding user to docker group to avoid using sudo
sudo usermod -aG docker ${USER}
id ${USER} -nG
```