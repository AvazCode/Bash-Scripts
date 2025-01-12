#!/bin/bash
read -p "Enter the IP address or domain to block:" ip 
iptables -I INPUT -s $ip -j DROP 
