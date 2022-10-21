#!/bin/bash
if [[ `whoami` != "root" ]];then
    echo "Run this script with root privilages!"
    exit 1
fi

cd `dirname $0`

node_script_location="node_scripts/*"

echo "Installing needed packages..."
apt install -y dnsmasq
systemctl stop dnsmasq
systemctl disable dnsmasq

echo "Copying scripts /etc/node-scripts/"
mkdir -p /etc/node-scripts/
cp -r $node_script_location /etc/node-scripts/


for file in $node_script_location
do
  is_in_file=`grep "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" /etc/sudoers`
  if [[ $is_in_file != "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" ]];then
    echo "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" >> /etc/sudoers
  fi
done