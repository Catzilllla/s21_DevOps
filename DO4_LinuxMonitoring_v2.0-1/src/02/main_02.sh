#!/bin/bash

# our path for new files
path="$HOME/DO4_LinuxMonitoring_v2.0-1/src/02"

# list words of "az" in name folders 4 < name < 7
str_fold=$1
list_az=()
for (( i=0; i<${#str_fold}; i++ )); do
    list_az+=("${str_fold:i:1}")
done

# ${str_fold:i:1}"
# str="hello"
# for char in ${str}; do
#     echo "${char}"
# done

# az.az file_name < 7 && *. < 3
str_file=$2
list_file_dot=()
for (( i=0; i<${#str_file}; i++ )); do
    if [[ ${str_file:i:1} != "." ]]
    then
        list_file_dot+=("${str_file:i:1}")
    fi
done

# file size Mb
check_size=$3
sizefile=500
# for char in ${check_size}; do
#     if [[ $char =~ ^[0-9]+$ ]]; then
#         sizefile=("${sizefile}${char}")
#     fi
# done

# main.sh /opt/test 4 az 5 az.az 3kb
# Name of folders must contents only alphabetic symbols and used this symbol only 1 count.
# ./aaaz_021121/, ./aaazzzz_021121

# != ./zaaa_021121/,

name_folder_date=$(date +"%d%m%y")
name_file_date=$(date +"%d%m%y")

# on host when ends of space less 1Gb the script must ending.
#MY_SPACE=$(df -h | awk 'NR==4 {print $4}' | tr -cd '[:digit:]')
MY_SPACE=$(df -h | awk 'NR==4 {printf "%.0f", $4}')

count_file_folder=100

function file_creater {
    for (( k=1; k <= $count_file_folder; k++ ))
    do
        length_file=$(( RANDOM%4+4 ))
        for (( m=1; m <= $length_file; m++ ))
        do
            result_file_name=()
            name_file=""

            # check among all symbol
            # zaaazaaaz
            # zaa
            # check_alone=$result_file_name
            # check_len_name=${#check_alone}
            # for char ${check_alone}; do
            #     if [[ $char == "z" ]]
            #     then

            for (( n=1; n <= $length_file; n++ ))
            do
                az_lenght_FILE=$(( RANDOM%2 ))
                if [[ $az_lenght_FILE -eq 0 ]]
                then
                    name_file="${name_file}${list_file_dot[0]}"
                else
                    name_file="${name_file}${list_file_dot[1]}"
                fi
                result_file_name=$name_file
            done
        done

        length_expansion=$(( RANDOM%4 ))
        for (( o=1; o <= $length_expansion; o++ ))
        do
            result_expansion=()
            expan_file=""
            for (( p=1; p <= $length_expansion; p++ ))
            do
                az_lenght_expension=$(( RANDOM%2 ))
                if [[ $az_lenght_expension -eq 0 ]]
                then
                    expan_file="${expan_file}${list_file_dot[2]}"
                else
                    expan_file="${expan_file}${list_file_dot[3]}"
                fi
                result_expansion=$expan_file
            done
        done

        if [[ ${result_expansion} != 0 ]]
        then
            created_file_name=$new_folder_path/${result_file_name}_${name_file_date}.${result_expansion}
        else
            created_file_name=$new_folder_path/${result_file_name}_${name_file_date}
        fi

        MY_SPACE=$(df -h | awk 'NR==4 {printf "%.0f", $4}')

        if [[ $MY_SPACE > 1 ]]
        then
            # block_size=$(( $size_file * {0.5} ))
            ratio=2
            let "blocksize = $sizefile / $ratio"
            # D=$(bc<<<"scale=3;$sizefile/$ratio")
            dd if=/dev/zero of=$created_file_name bs=${blocksize}M count=1
            echo "name = [ $created_file_name ]; date = [$name_file_date]; size = [ {$size_file}M ]" >> file_creater.log
        else
            echo "Error: Host space less then 1 Gb"
            time_end=$(date +%s)
            result_time=$((time_end - time_start))
            echo "Result time script executing = $result_time"
            exit 0
        fi
        clear
    done
}

function generation_files {
    if [[ $MY_SPACE -ge 1 ]]
    then
        # script execution
        echo "|||||||||||||| GEN FOLDERS ||||||||||||||||||"
        # for {name} generation script
        # echo $name_folder_date
        while [ 1 ]
        do
            # aaaz
            # aaaaaaz
            # получаем 0 1 2 3
            length=$(( RANDOM%4+4 ))
            for (( i=1; i < $length; i++ ))
            do
                result_name=()
                name_folder=""
                for (( j=1; j < $length; j++ ))
                do
                    az_lenght=$(( RANDOM%2 ))
                    if [[ $az_lenght -eq 0 ]]
                    then
                        name_folder="${name_folder}${list_az[0]}"
                    else
                        name_folder="${name_folder}${list_az[1]}"
                    fi
                    result_name=$name_folder
                done
            done
            mkdir $path/${result_name}_${name_folder_date}

            #echo "|||||||||||||| GEN FILES ||||||||||||||||||"
            new_folder_path=$path/${result_name}_${name_folder_date}
            file_creater
        done
    else
        echo "Error: Host space less then 1 Gb"
    fi
}

if [ $# -gt 0 ]
then
	time_start=$(date +%s)
    # script
    
    generation_files
else
	echo "Error: the Script should have parameters!"
fi

echo "||||||||||||||||| RESULT |||||||||||||||||||||"
ls -la
df -h
echo "||||||||||||||||| END SC |||||||||||||||||||||"
echo "Space available = $MY_SPACE"