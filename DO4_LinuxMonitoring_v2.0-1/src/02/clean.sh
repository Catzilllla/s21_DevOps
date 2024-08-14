#!/bin/bash

rm -rf a* z* _* *.log *_*24

str_file=$1
list_file_dot=()
for (( i=0; i<${#str_file}; i++ )); do
    if [[ ${str_file:i:1} != "." ]]
    then
        list_file_dot+=("${str_file:i:1}")
    fi
done

for char in ${list_file_dot[@]}; do
    echo "${char}"
done
