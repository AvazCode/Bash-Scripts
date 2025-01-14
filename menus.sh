#!/bin/bash
PS3="What is your option ?: "

select COUNTRY in Uzbekistan USA "United Kingdom" Afganistan Quit
do 
	case $REPLY in
		1)
			echo "You ara living in Uzbekistan .."
			;;
		2)
			echo " You ara living in USA .."
			;;
		3)
                          echo " You ara living in United Kingdom .."
                        ;;
		4) 
			echo "You are afgan ! "
			;;
		5)
			echo "You are exiting ..."
			sleep 2
			echo "Done"
			exit
			;;
esac
done
