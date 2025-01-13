#!/bin/bash
read -p "Enter your age: " age
echo "  -Your age is $age. Monitoring .... "
sleep 2
if [ $age -ge 18 ]
then
    echo "----You are eligible to vote."
else
    echo "----You are not eligible to vote."
fi
echo "      Monitoring completed."