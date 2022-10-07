#!/bin/bash

if [[ `whoami` != "root" ]];then
    echo "Run this script with root privilages!"
    exit 1
fi


echo "Installing needed packages..."
apt install dnsmasq
systemctl stop dnsmasq
systemctl disable dnsmasq

echo "Copying scripts /etc/node-scripts/"
mkdir -p /etc/node-scripts/
cp -r ./node_scripts/* /etc/node-scripts/

SCRIPTS="node_scripts/*"
for file in $SCRIPTS
do
  is_in_file=`grep "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" /etc/sudoers`
  if [[ $is_in_file != "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" ]];then
    echo "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" >> /etc/sudoers
  fi
done