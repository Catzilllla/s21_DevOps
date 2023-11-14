#!/bin/bash

. ./mypattern

sc_path=$1
time_start=$(date +%s)

total_dir=$(ls -A $sc_path | wc -l)
top_5_big_low=$(du -h $sc_path | sort -rh | head -5 | cat -n | awk 'BEGIN{ORS="\n"}{print $1" - "$3", "$2}')
#top_5_big_low=$(find $sc_path -type d -exec du -h {} + | sort -rh | head -5 | cat -n | awk '{print $1" - "$2", "$3}')
total_files=$(find $sc_path -type f | wc -l)
count_conf=$(find $sc_path -name "*.conf" | wc -l)
text_files=$(find $sc_path -name "*.txt" | wc -l)
exe_files=$(find $sc_path -type f -executable | wc -l)
log_files=$(find $sc_path -name "*.log" | wc -l)
arch_files=$(find $sc_path -name "*.zip" -or -name "*.tar" -or -name "*.gz" -or -name "*.bz2" | wc -l)
symb_links=$(find $sc_path -type l | wc -l)

#top_10_big_low_type=$(find $sc_path -type f -exec ls -lh {} + | sort -rh | head -10 | cat -n | awk '{printf "%s - %s, %s, %s\n", $1, $10, $6, $10}')

function get_size() {
	local size=$(du -sh $2 | awk '{print $1}')
	echo $size
}

function get_num() {
	echo $1
}

function get_type() {
	local type=${2##*.}
	buffer=$type
	echo $buffer
}

function get_file() {
	echo $2
}

function get_hash() {
	local hash_file=$(md5sum $2 | awk '{print $1}')
	echo $hash_file
}

top_10_big_low_type=$(find $sc_path -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '/[.]/{print $1, $3}' | while read file; do echo "$(get_num $file) - $(get_file $file),  $(get_size $file), $(get_type $file)"; done)
#top_10_big_low_type=$(find $sc_path -type f -exec ls -lSh {} + | head -10 | cat -n | awk '{print $1, $6, $10}' | while read file; do echo "$(get_num $file) - $(get_file $file),  $(get_size $file), $(get_type $file)"; done)
#top_10_big_low_exec=$(find $sc_path -type f -executable -exec ls -lSh {} | head -10 | cat -n)
# | awk '{$11=;printf "%s - %s, %s, %s\n", $1, $10, $6, $11}')
#top_10_big_low_exec=$(find $sc_path -type f -executable -exec ls -lSh {} md5sum \; | sort -rh | head -10 | cat -n)
# | awk 'BEGIN{ORS="\n"}{print $1" - "$3", "$2", "$4", "$5}')

top_10_big_low_exec=$(find $sc_path -type f -executable -printf '%s %p\n' | sort -rh | head -10 | cat -n | awk '{print $1,$3}' | while read file; do echo "$(get_num $file) - $(get_file $file), $(get_size $file), $(get_hash $file)"; done)

if [ $# -gt 0 ]
then
	time_end=$(date +%s)
	time_exe=$((time_end - time_start))
	pattern
#	echo $total_dir
#	echo $top_5_big_low
#	echo $total_files
else
	echo "Error: the Script should have parameters!"
fi


