#!/bin/bash
read -p "Enter your age: " age

if [ -z "$age" ]
then
    echo "You have not entered any parameter."
else
    echo "  -Your age is $age. Monitoring .... "
    sleep 2
    
    if [ $age -ge 18 ]
    then
        echo "----You are eligible to vote."
    else
        echo "----You are not eligible to vote."
    fi
fi
