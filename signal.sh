#!/bin/bash
if [[ $# -ne 2 ]]
then
	echo "There must be 2 parameters!"
	exit 1
fi

case $1 in
1)
	echo "Sending SIGHUP signal to $2"
	kill -SIGHUP $2
	;;
2)
	echo "Sending SIGINT signal to $2"
	kill -SIGINT $2
	;;
3)
	echo "Sending SIGTERM signal to $2"
	kill -15 $2
	;;
*)
	echo "SIGNAL no. $1 will not be delivered"
	;;
esac
	
