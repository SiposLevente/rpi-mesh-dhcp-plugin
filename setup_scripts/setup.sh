#!/bin/bash
if [[ `whoami` != "root" ]];then
    echo "Run this script with root privilages!"
    exit 1
fi

if [[ $1 == "local" ]];then
  node_script_location="node_scripts/*"
else
  node_script_location="/var/www/html/plugins/rpi-mesh-dhcp-plugin/setup_scripts/node_scripts/*"
fi

echo "Installing needed packages..."
apt install -y dnsmasq
systemctl stop dnsmasq
systemctl disable dnsmasq

echo "Copying scripts /etc/node-scripts/"
mkdir -p /etc/node-scripts/
cp -r $node_script_location /etc/node-scripts/

SCRIPTS=$node_script_location
for file in $SCRIPTS
do
  is_in_file=`grep "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" /etc/sudoers`
  if [[ $is_in_file != "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" ]];then
    echo "www-data ALL = NOPASSWD: /etc/node-scripts/${file##*/}" >> /etc/sudoers
  fi
done