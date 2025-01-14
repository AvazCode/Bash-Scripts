#!/bin/bash
PS3="Your choice: "
select ITEM in "Add your user" "List All Process" "Kill Process" "Install Program" "Quit"
do
	if [[ $REPLY -eq 1 ]]
	then
		read -p "Enter the username: " username
		output="$(grep -w "$username" /etc/passwd)"
		if [[ -n "$output" ]]
		then
			echo "This user is already exists .. $username"
		else
			sudo useradd -m -s /bin/bash "$username"
			if [[ $? -eq 0 ]] # [[ #? -eq 0 ]] means that the previous command was successful
			then
				echo "The user $username has been added successfully !"
				tail -n 1 /etc/passwd
			else
				echo "There was an error adding user ! "
			fi
		fi
			
	elif [[ $REPLY -eq 2 ]]
	then
		echo "Listing all processes ... "
		sleep 2
		ps -ef
	elif [[ $REPLY -eq 3 ]]
	then
		read -p "Enter the process to kill: " process
		pkill $process
	elif [[ $REPLY -eq 4 ]]
	then
		read -p "Enter the program to install: " app
		sudo apt update && sudo apt install $app -y
	elif [[ $REPLY -eq 5 ]]
	then
		echo "Quiting ..."
		sleep 1
		exit
	else
		echo "Invalid mene selection ! "	
	fi
done
