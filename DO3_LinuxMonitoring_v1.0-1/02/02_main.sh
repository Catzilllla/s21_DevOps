#!/bin/bash

function func2 {
	echo HOSTNAME = $(hostname)
	echo TIMEZONE = $(cat /etc/timezone)
	echo USER = $(whoami)
	echo OS = $(lsb_release -ds)
	echo DATE = $(date +"%d %b %Y %H:%M:%S")
	echo UPTIME = $(uptime | awk {'print $1'})
	echo UPTIME_SEC = $(cat /proc/uptime | awk {'print $1'})
	echo IP = $(ifconfig | head -2 | grep inet | awk {'print $2'})
	echo MASK = $(ifconfig | head -2 | grep netmask | awk {'print $4'})
	echo GATEWAY = $(ip r | grep default | awk {'print $3'})
	echo RAM_TOTAL= $(free -m | grep Mem | awk {'printf "%.3f GB\n", $2/1000'})
	echo RAM_USED = $(free -m | grep Mem | awk {'printf "%.3f GB\n", $3/1000'})
	echo RAM_FREE = $(free -m | grep Mem | awk {'printf "%.3f GB\n", $4/1000'})
	echo SPACE_ROOT = $(df / | grep mapper | awk {'printf "%.2f GB\n", $2/1000'})
	echo SPACE_ROOT_USED = $(df / | grep mapper | awk {'printf "%.2f GB\n", $3/1000'})
	echo SPACE_ROOT_FREE = $(df / | grep mapper | awk {'printf "%.2f GB\n", $4/1000'})
}

function saveinf {
	func2
	echo "Save information in file? Yy/Nn?"
	read answer
	if [[ answer -eq "Y" || answer -eq "y" ]] 
	then
		name_file=$(date +"%d_%b_%Y_%H_%M_%S")
		exec 1> $name_file.status
		func2
	else
		echo "Not save in file, bb cya!"
	fi
}

if [ -n "$1" ]
then
	saveinf
else
	echo "No parameters found."
fi
