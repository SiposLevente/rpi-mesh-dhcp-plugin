#!/bin/bash

if [[ `whoami` != "root" ]];then
    echo "Run this script with root privilages!"
    exit 1
fi


echo "Installing needed packages..."
apt install dnsmasq
systemctl stop dnsmasq
systemctl disable dnsmasq

SCRIPTS="none_scripts/*"
for file in $SCRIPTS
do
  echo "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" >> /etc/sudoers
done

