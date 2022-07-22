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