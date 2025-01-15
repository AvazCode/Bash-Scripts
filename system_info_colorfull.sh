#!/bin/bash

# Color designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)
WHITE='\033[1;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
BLACK='\033[0;30m'

# System information retrieval
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, $4}')
USER=$(whoami)
OS=$(lsb_release -d | awk -F"\t" '{print $2}')
DATE=$(date +"%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I | awk '{print $1}')
MASK=$(ifconfig | grep -A 1 "$(hostname -I | awk '{print $1}')" | tail -n 1 | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -g | grep Mem | awk '{print $2}')
RAM_USED=$(free -g | grep Mem | awk '{print $3}')
RAM_FREE=$(free -g | grep Mem | awk '{print $4}')
SPACE_ROOT=$(df / | tail -1 | awk '{print $2 / 1024}')
SPACE_ROOT_USED=$(df / | tail -1 | awk '{print $3 / 1024}')
SPACE_ROOT_FREE=$(df / | tail -1 | awk '{print $4 / 1024}')

# Format RAM and disk space
RAM_TOTAL=$(echo "scale=3; $RAM_TOTAL / 1024" | bc)
RAM_USED=$(echo "scale=3; $RAM_USED / 1024" | bc)
RAM_FREE=$(echo "scale=3; $RAM_FREE / 1024" | bc)
SPACE_ROOT=$(echo "scale=2; $SPACE_ROOT" | bc)
SPACE_ROOT_USED=$(echo "scale=2; $SPACE_ROOT_USED" | bc)
SPACE_ROOT_FREE=$(echo "scale=2; $SPACE_ROOT_FREE" | bc)

# Parameter check
if [[ $# -eq 4 ]]
then
    for param in "$@"
    do
        if ! [[ $param =~ ^[1-6]$ ]]
        then
            echo -e "  $param is not a number between ${RED}1 and 6!"
            echo -e "${PURPLE}Try again.."
            exit 1
        fi
    done

    # Ensure background and font colors don't match
    if [[ $1 -eq $2 || $3 -eq $4 ]]
    then
        echo -e "${RED}Background and font colors must not be the same!"
        echo -e "${WHITE}Please restart the script with different colors."
        exit 1
    else 
        # Background colors for value names (HOSTNAME, TIMEZONE, etc.)
        case $1 in
            1) bg=$WHITE ;;
            2) bg=$RED ;;
            3) bg=$GREEN ;;
            4) bg=$BLUE ;;
            5) bg=$PURPLE ;;
            6) bg=$BLACK ;;
        esac

        # Font colors for value names (HOSTNAME, TIMEZONE, etc.)
        case $2 in
            1) font=$WHITE ;;
            2) font=$RED ;;
            3) font=$GREEN ;;
            4) font=$BLUE ;;
            5) font=$PURPLE ;;
            6) font=$BLACK ;;
        esac

        # Background colors for values (after '=' sign)
        case $3 in
            1) bg_val=$WHITE ;;
            2) bg_val=$RED ;;
            3) bg_val=$GREEN ;;
            4) bg_val=$BLUE ;;
            5) bg_val=$PURPLE ;;
            6) bg_val=$BLACK ;;
        esac

        # Font colors for values (after '=' sign)
        case $4 in
            1) font_val=$WHITE ;;
            2) font_val=$RED ;;
            3) font_val=$GREEN ;;
            4) font_val=$BLUE ;;
            5) font_val=$PURPLE ;;
            6) font_val=$BLACK ;;
        esac

        # Output the data with specified colors
        echo -e "${bg}${font}HOSTNAME=${bg_val}${font_val}$HOSTNAME"
        echo -e "${bg}${font}TIMEZONE=${bg_val}${font_val}$TIMEZONE"
        echo -e "${bg}${font}USER=${bg_val}${font_val}$USER"
        echo -e "${bg}${font}OS=${bg_val}${font_val}$OS"
        echo -e "${bg}${font}DATE=${bg_val}${font_val}$DATE"
        echo -e "${bg}${font}UPTIME=${bg_val}${font_val}$UPTIME"
        echo -e "${bg}${font}UPTIME_SEC=${bg_val}${font_val}$UPTIME_SEC"
        echo -e "${bg}${font}IP=${bg_val}${font_val}$IP"
        echo -e "${bg}${font}MASK=${bg_val}${font_val}$MASK"
        echo -e "${bg}${font}GATEWAY=${bg_val}${font_val}$GATEWAY"
        echo -e "${bg}${font}RAM_TOTAL=${bg_val}${font_val}$RAM_TOTAL GB"
        echo -e "${bg}${font}RAM_USED=${bg_val}${font_val}$RAM_USED GB"
        echo -e "${bg}${font}RAM_FREE=${bg_val}${font_val}$RAM_FREE GB"
        echo -e "${bg}${font}SPACE_ROOT=${bg_val}${font_val}$SPACE_ROOT MB"
        echo -e "${bg}${font}SPACE_ROOT_USED=${bg_val}${font_val}$SPACE_ROOT_USED MB"
        echo -e "${bg}${font}SPACE_ROOT_FREE=${bg_val}${font_val}$SPACE_ROOT_FREE MB"
    fi
else
    echo -e "Error: ${RED}The script must be run with ${GREEN}4 parameters!"
fi

