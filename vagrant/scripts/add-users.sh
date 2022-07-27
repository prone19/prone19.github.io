#!/bin/bash

# file contained usernames
userfile=/tmp/userlist

# extracting usernames from the file
username=$(cat $userfile | grep -Eo '^\w*? ' | tr 'A-Z'  'a-z')

# running loop  to add users
for user in $username
do
    useradd -s /bin/bash -d /home/$user/ -m $user
    mkdir /home/$user/.ssh/
    chmod 711 /home/$user/.ssh/
    my_ssh_key=$(cat $userfile | grep -E "$user" | grep -Eo 'ssh-rsa.*')
    echo "${my_ssh_key}" >> /home/$user/.ssh/authorized_keys

    # adding the user to the docker group
    usermod -aG docker $user
    id $user -nG
done

# display the details
echo "$(wc -l $userfile) users have been created" 
tail -n$(wc -l $userfile) /etc/passwd
