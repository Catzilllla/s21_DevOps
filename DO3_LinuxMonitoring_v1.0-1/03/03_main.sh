#!/bin/bash

. ./paint_lib
. ./func
. ./col_func

#column1_background=$1
#column1_font_color=$2
#column2_background=$3
#column2_font_color=$4

default="\033[0m"

white_b="\033[47"
red_b="\033[41m"
green_b="\033[42m"
blue_b="\033[46m"
purple_b="\033[45m"
black_b="\033[40m"

white_t="\033[37m"
red_t="\033[31m"
green_t="\033[32m"
blue_t="\033[36m"
purple_t="\033[35m"
black_t="\033[30m"

paint[1]=6
paint[2]=1
paint[3]=6
paint[4]=1

if [ -n "$1" ]
then
	if [[ $1 -eq $2 || $3 -eq $4 ]]
	then
		echo "Error: Color of background and text same../\n"
		echo "Do you wanna execute a new loop of bash script...(Yy/Nn)?/\n"
		read answer
		if [[ $answer="Y" || $answer="y" ]]
		then
			echo "Please enter 1st color"
			read color_1
			echo "Please enter 2nd color"
			read color_2
			echo "Please enter 3rd color"
			read color_3
			echo "Please enter 4th color"
			read color_4
			func
			col_func $color_1 $color_2 $color_3 $color_4
			paint_lib ${paint[1]} ${paint[2]} ${paint[3]} ${paint[4]}
		else
			exit 1
		fi
	else
		func
		col_func $1 $2 $3 $4
		paint_lib ${paint[1]} ${paint[2]} ${paint[3]} ${paint[4]}
	fi
else
	echo "No parameters found."
fi
