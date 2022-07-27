#!/bin/bash

echo "--- disabling password logging in ---"
sed -i -E 's/#?PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep PasswordAuthentication
service ssh restart