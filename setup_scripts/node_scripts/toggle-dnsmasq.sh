#!/bin/bash

status="`systemctl is-active dnsmasq.service`"

if [[ $status == 'active' ]];
then
	systemctl stop dnsmasq.service
else
	systemctl start dnsmasq.service
fi
