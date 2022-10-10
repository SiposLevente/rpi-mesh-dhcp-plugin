#!/bin/bash

status="`systemctl is-active dnsmasq.service`"

if [[ $status == 'active' ]];
then
	systemctl stop dnsmasq.service
	systemctl disable dnsmasq.service
else
	systemctl start dnsmasq.service
	systemctl enable dnsmasq.service
fi
