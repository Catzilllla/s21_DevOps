#!/bin/bash

function check_input() {
    if ! [[ $# -eq 1 ]]
    then 
        echo " You can specify only one argument in the range 1-4 "
        exit 1 
    else
        if ! [[ $1 =~ ^[1-4]$ ]]
        then 
            echo " You can specify only one argument in the range 1-4 "
            exit 1
        fi
    fi
}

check_input $@

if [[ $? -eq 0 ]]
then
 if [[ $1 -eq 1 ]]
    then
        for i in {1..5}; do
            awk '{print $0}' nginx_logs/access_log_$i.log | sort -k9 #>> sort_by_code.log
        done
    fi

    if [[ $1 -eq 2 ]]
    then
        for i in {1..5}; do
            awk '{print $1}' nginx_logs/access_log_$i.log | sort -u #>> uniq_ip.log
        done
    fi

     if [[ $1 -eq 3 ]]
    then
        for i in {1..5}; do
            awk '$9 ~ /[45]0[0-9]/' nginx_logs/access_log_$i.log  #>> error_code.log
        done
    fi
    if [[ $1 -eq 4 ]]
    then
        for i in {1..5}; do
            awk '$9 ~ /[45]0[0-9]/' nginx_logs/access_log_$i.log | awk '{print $1}' | sort -u #>> uniq_ip_error_code.log
        done
    fi
fi
