#!/bin/bash
read -p "String1: " str1
read -p "String2: " str2

if [[ -z "$str1" || -z "$str2" ]]
then
    echo "Please enter two strings"
else
    if [[ "$str1" == "$str2" ]]
    then
        echo "Strings are equal"
    else
        echo "Strings are not equal"
    fi
fi

# echo $? #shows the exit status of the last executed command
# echo $# # Number of arguments
# echo $@ # All arguments
# echo $* # All arguments
# echo $0 # Script name
# # diffirence between $@ and $* is that $@ treats each quoted argument 
#                 #as a separate argument while $* treats all the quoted arguments as a single argument