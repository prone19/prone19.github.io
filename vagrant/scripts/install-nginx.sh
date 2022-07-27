#!/bin/bash

set -e

apt-get update -y -qq 
#apt-get upgrade -y -qq 

echo "Installing nginx"
apt-get install nginx=1.18.* -y
service nginx start

echo "Checking nginx..."
service nginx status
wget -qO- localhost