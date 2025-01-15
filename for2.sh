#!/bin/bash
for item in ./*
do	
	if [[ -f $item ]]
	then
		echo "$item is displaying ... "
		echo "-----------($item)---------"
		echo "----------------------------"
	else
		echo "This $item is not a file "
	fi
done

