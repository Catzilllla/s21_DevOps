#!/bin/bash

. ./get_info_path
. ./print_info_path
. ./check_path

start_time=$(date +%s)
if [ $# -eq 1 ];
then
    path=$1;
    check_path
    if (( check_path == 0 )) ;
    then 
                get_info_path
                print_info_path
                end_time=$(date +%s)
                echo "Script execution time (in seconds) = $((end_time - start_time))"
    else
        echo "Error: path is incorrect."
    fi
else
    echo "Error: incorrect number of parameters."
fi
exit 0