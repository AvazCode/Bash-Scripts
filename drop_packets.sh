#!/bin/bash
read -p "Enter IP, Newwork or domain to drop: " ip
echo "Blocking connections from $ip ...."
sleep 2
iptables -I INPUT -s $ip -j DROP
echo "Done"
