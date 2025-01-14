#!/bin/bash
output="$(ping -c 3 $1)"
if [[ "$output" == *"100% packet loss"* ]]
then
	echo "Ping is not working ....... packet loss"
else
	echo "Ping is working correctly not packet loss"
fi

#echo $output
