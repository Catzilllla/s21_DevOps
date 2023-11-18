#!/bin/bash

. ./col_scheme.conf
. ./paint_lib
. ./func
. ./col_func

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

check='^[1-6]$'

if [ $# -eq 0 ];
then
	func
	if [[ $column1_background =~ $check && $column1_font_color =~ $check && $column2_background =~ $check && $column2_font_color =~ $check ]];
	then
		col_func $column1_background $column1_font_color $column2_background $column2_font_color
		paint_lib ${paint[1]} ${paint[2]} ${paint[3]} ${paint[4]}
		printf "\n"
		echo "Column 1 background = $column1_background ($color_1)"
		echo "Column 1 font_color = $column1_font_color ($color_2)"
		echo "Column 2 background = $column2_background ($color_3)"
		echo "Column 2 font_color = $column2_font_color ($color_4)"
	else
		column1_background=6
		column1_font_color=1
		column2_background=2
		column2_font_color=4
		col_func ${column1_background} $column1_font_color $column2_background $column2_font_color
		paint_lib ${paint[1]} ${paint[2]} ${paint[3]} ${paint[4]}
		printf "\n"
		echo "Column 1 background = default (black)"
		echo "Column 1 font_color = default (white)"
		echo "Column 2 background = default (red)"
		echo "Column 2 font_color = default (blue)"
	fi
else
	echo "Error: the Script should not have parameters!"
fi
