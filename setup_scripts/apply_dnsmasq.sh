#!/bin/bash
echo "interface=$1" > /etc/dnsmasq.conf
echo "dhcp-range=$4,$5,$3,$2s" >> /etc/dnsmasq.conf
echo "dhcp-option=option:router,$6" >> /etc/dnsmasq.conf
echo "server=$7" >> /etc/dnsmasq.conf
