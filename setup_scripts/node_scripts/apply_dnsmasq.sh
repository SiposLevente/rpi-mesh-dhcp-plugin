#!/bin/bash
echo "interface=$1" > /etc/dnsmasq.conf
echo "dhcp-range=$4,$5,$3,$2s" >> /etc/dnsmasq.conf
if [[ $6 != "null" ]];then
echo "dhcp-option=option:router,$6" >> /etc/dnsmasq.conf
fi
if [[ $7 != "null" ]];then
echo "server=$7" >> /etc/dnsmasq.conf
fi
if [[ $8 != "null" ]];then
echo "server=$8" >> /etc/dnsmasq.conf
fi
systemctl restart dnsmasq.service
