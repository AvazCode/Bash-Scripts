!/bin/bash
echo "Blocking connections from $1 ...."
sleep 2
iptables -I INPUT -s $1 -j DROP
echo "Done"
