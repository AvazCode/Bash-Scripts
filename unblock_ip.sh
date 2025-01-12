#!/bin/bash
read -p "Enter the IP address or domain to unblock: " ip
echo "Unblocking address :$ip ... "
sleep 2
iptables -D INPUT -s $ip -j DROP
echo "Done ..."
