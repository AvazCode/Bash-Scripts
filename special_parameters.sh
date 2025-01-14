#!/bin/bash

# This command creates files to _ space
#touch $@ # touch "$1 $2 $3"

#This command do not except first word.
touch "$@" 


# echo $? #shows the exit status of the last executed command
# echo $# # Number of arguments
# echo $@ # All arguments
# echo $* # All arguments
# echo $0 # Script name
# # diffirence between $@ and $* is that $@ treats each quoted argument 
#                 #as a separate argument while $* treats all the quoted arguments as a single argument