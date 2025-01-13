#!/bin/bash
if [[ -f "$1" ]]
then
    echo "$1 file's info is showing ..."
    sleep 2
    echo "--------------------------"
    cat $1
    echo "--------------------------"
elif [[ -d "$1" ]]
then
    echo "$1 is a directory"
else
    echo "Error: $1 does not exist"
fi