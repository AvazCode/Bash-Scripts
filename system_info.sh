#!/bin/bash

# Get the hostname of the system
HOSTNAME=$(hostname)

# Get the timezone and UTC offset
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, $4}')

# Get the current logged in user
USER=$(whoami)

# Get the operating system description
OS=$(lsb_release -d | awk -F"\t" '{print $2}')

# Get the current date and time
DATE=$(date +"%d %b %Y %H:%M:%S")

# Get the system uptime in a human-readable format
UPTIME=$(uptime -p)

# Get the system uptime in seconds
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')

# Get the primary IP address of the system
IP=$(hostname -I | awk '{print $1}')

# Get the subnet mask of the primary IP address
MASK=$(ifconfig | grep -A 1 "$(hostname -I | awk '{print $1}')" | tail -n 1 | awk '{print $4}')

# Get the default gateway
GATEWAY=$(ip route | grep default | awk '{print $3}')

# Get the total RAM in GB
RAM_TOTAL=$(free -g | grep Mem | awk '{print $2}')

# Get the used RAM in GB
RAM_USED=$(free -g | grep Mem | awk '{print $3}')

# Get the free RAM in GB
RAM_FREE=$(free -g | grep Mem | awk '{print $4}')

# Get the total disk space of the root filesystem in MB
SPACE_ROOT=$(df / | tail -1 | awk '{print $2 / 1024}')

# Get the used disk space of the root filesystem in MB
SPACE_ROOT_USED=$(df / | tail -1 | awk '{print $3 / 1024}')


# Get the free disk space of the root filesystem in MB
SPACE_ROOT_FREE=$(df / | tail -1 | awk '{print $4 / 1024}')

# Format RAM in GB to 3 decimal places
RAM_TOTAL=$(echo "scale=3; $RAM_TOTAL / 1024" | bc)
RAM_USED=$(echo "scale=3; $RAM_USED / 1024" | bc)
RAM_FREE=$(echo "scale=3; $RAM_FREE / 1024" | bc)

# Format disk space to MB with 2 decimal places
SPACE_ROOT=$(echo "scale=2; $SPACE_ROOT" | bc)
SPACE_ROOT_USED=$(echo "scale=2; $SPACE_ROOT_USED" | bc)
SPACE_ROOT_FREE=$(echo "scale=2; $SPACE_ROOT_FREE" | bc)

# Output all data to a file
cat <<EOF > output.txt
HOSTNAME=$HOSTNAME
TIMEZONE=$TIMEZONE
USER=$USER
OS=$OS
DATE=$DATE
UPTIME=$UPTIME
UPTIME_SEC=$UPTIME_SEC
IP=$IP
MASK=$MASK
GATEWAY=$GATEWAY
RAM_TOTAL=$RAM_TOTAL GB
RAM_USED=$RAM_USED GB
RAM_FREE=$RAM_FREE GB
SPACE_ROOT=$SPACE_ROOT MB
SPACE_ROOT_USED=$SPACE_ROOT_USED MB
SPACE_ROOT_FREE=$SPACE_ROOT_FREE MB
EOF

# print all data
cat output.txt

# Asking from user save file or not ? 
read -p "Do you write the data to a file ? -Y/N: " answer
if [[ "$answer" == "Y" || "$answer" == "y" ]]
then
    cat output.txt > "$(date +"%d_%m_%y_%H_%M_%S")".status
fi

#deleting saved output.txt
rm output.txt
