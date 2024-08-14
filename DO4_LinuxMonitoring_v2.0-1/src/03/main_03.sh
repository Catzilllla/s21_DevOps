#!/bin/bash

# our path for new files
# path="$HOME/DO4_LinuxMonitoring_v2.0-1/src/03"
path=`pwd`

# massive of search folders
core_folder_massive=()

function search_all_folders_root {
    flag_var_10_e=1
    flag_var_10=1

    for var in $(find / -maxdepth 15 -mindepth 1 -xtype d -not -path '/proc/*' -not -path '/bin/*' -not -path '/sbin/*' -not -path '/sys/*')
    do
        core_folder_massive+=("$var")
        flag_var_10_e=$(( $flag_var_10_e + 1 ))
    done
    echo $flag_var_10_e
    echo "Waiting your enter ..."
    read
}

# 1 - log file
log_file=file_creater.log

function script_1 {
    # По лог файлу

    count_files=0

    search_all_folders_root

    for folder_path in ${core_folder_massive[@]}
    do
        # echo $folder_path
        for file_in_folder in $(find $folder_path -type f -name "*_*0224*")
        do
            rm -rf $file_in_folder
            # echo $(date +"%d%m%y")
            # sleep 1
            # clear
        done
        # read
    done

    # while read line_stroka
    # do
    #     # echo $line_stroka
    #     IFS=';'
    #     set -- $line_stroka
    #     file_path_to_delete=$1
    #     echo $file_path_to_delete
    #     # IFS='/'
    #     # set -- $line_stroka
    #     # rm -rf "$7/$8"
    #     # rm -rf "$7"
    #     rm -rf $file_path_to_delete

    #     flag_var_10=$(( $flag_var_10 + 1 ))
    # done < $log_file

    time_end=$(date +%s)
    result_time=$((time_end - time_start))
    echo "|||| end script 1 |||| $result_time"
    echo $flag_var_10
    exit 0
}

function script_2 {
    # 2 - По дате и времени создания
    # При удалении по дате и времени создания, пользователем вводятся времена начала и конца 
    # с точностью до минуты. Удаляются все файлы, созданные в указанном временном промежутке. 
    # Ввод может быть реализован как через параметры, так и во время выполнения программы.

    count_files=0

    before_sc_1_2_sc

    echo "||| Enter START time about deleting files: 2022-01-01 00:00 |||"
    read time_start_delete
    start_date=$(date -d "$time_start_delete" +"%Y-%m-%d %H:%M")
    echo $start_date

    echo "||| Enter END time about deleting files:   2022-01-01 00:00 |||"
    read time_end_delete
    end_date=$(date -d "$time_end_delete" +"%Y-%m-%d %H:%M")

    mask_del_date=$(date +"%m%y")
    # current_path_folder=$(find $path -type d)
    # for var in $current_path_folder
    # do
    #     if [[ ! $var == *"*_*${mask_del_date}"* ]]; then
    #         find $var -type f -newermt "$start_date" ! -newermt "$end_date" -exec rm {} \;
    #         echo $var
    #         read
    #     fi
    # done

    for new_notnew_file in $(find / -type f -newermt "$start_date" ! -newermt "$end_date" -name "*_*0224")
    do
        echo $new_notnew_file
        count_files=$(( $count_files + 1 ))
    done
    echo "COUNT FILES = $count_files"
    echo

    # check folder - if folder empty - rm -rf folder

    time_end=$(date +%s)
    result_time=$((time_end - time_start))
    echo "|||| end script 2 ||||" 
}


function script_3 {
    # 3 - По маске имени (т.е. символы, нижнее подчёркивание и дата).
    # count files & folders in script 3
    count_folders=0

    new_folder_date=$(date +"%d%m%y")
    echo $new_folder_date

    echo "SEARCH(S/s) generate files or REMOVE(R/r) this files or RESTART(E/e) Please enter ... "
    read next_answer

    if [[ $next_answer="S" || $next_answer="s" ]]; then
        search_files=$(sudo find / -type f -name "*_*0224*")
        for var_a in $search_files
        do
            echo $var_a
            count_files=$(( $count_files + 1 ))
        done
        echo "COUNT FILES = $count_files"

    elif [[ $next_answer="R" || $next_answer="r" ]]; then
        # search_files=$(find / -type f -name "*_${new_folder_date}*")
        for var_bb in $(find / -type f -name '*_*0224*')
        do
            echo $var_bb
            # rm -rf $var_bb

            count_files=$(( $count_files + 1 ))
        done
        echo "COUNT FILES = $count_files"

    elif [[ $next_answer="E" || $next_answer="e" ]]; then
        clear
        exit 0
    fi

    time_end=$(date +%s)
    result_time=$((time_end - time_start))

    echo "|||| time = $(date -d "$result_time" +"%Y-%m-%d %H:%M")"
    echo "|||| end script 3 ||||"
}

if [[ $1 == 1 ]]; then
    time_start=$(date +%s)
    echo "|||| start script 1 ||||"
    script_1
elif [[ $1 == 2 ]]; then
    time_start=$(date +%s)
    echo "|||| start script 2 ||||"
    cd $HOME
    cd ../../
    script_2
elif [[ $1 == 3 ]]; then
    time_start=$(date +%s)
    echo "|||| start script 3 ||||"
    script_3
else
    exit 0  
fi
