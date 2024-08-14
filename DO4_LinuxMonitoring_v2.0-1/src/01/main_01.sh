#!/bin/bash

# path
path=$1
# check path
# if [ ]

# count include folders
count_folders=$2

# list words of "az" in name folders 4 < name < 7
list_az=$3

# count file in created folder
count_file_folder=$4

# az.az file_name < 7 && *. < 3
list_AZ_dot_az=$5

# file size Kb < 100
size_file=$6

# main.sh /opt/test 4 az 5 az.az 3kb
# Name of folders must contents only alphabetic symbols and used this symbol only 1 count.
# ./aaaz_021121/, ./aaazzzz_021121

# != ./zaaa_021121/,

name_folder_date=$(date +"%d%m%y")
name_file_date=$(date +"%d%m%y")

# on host when ends of space less 1Gb the script must ending.
MY_SPACE=$(df -h | awk 'NR==4 {print $4}' | tr -cd '[:digit:]')


function file_creater {
    for (( k=1; k <= $count_file_folder; k++ ))
    do
        # name file
        length_file=$(( RANDOM%4+4 ))
        for (( m=1; m <= $length_file; m++ ))
        do
            result_file_name=()
            name_file=""
            for (( n=1; n <= $length_file; n++ ))
            do
                az_lenght_FILE=$(( RANDOM%2 ))
                if [[ $az_lenght_FILE -eq 0 ]]
                then
                    name_file="${name_file}a"
                else
                    name_file="${name_file}z"
                fi
                result_file_name=$name_file
            done
        done

        # expansion file
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
                    expan_file="${expan_file}a"
                else
                    expan_file="${expan_file}z"
                fi
                result_expansion=$expan_file
            done
        done

        created_file_name=$new_folder_path/${result_file_name}_${name_file_date}.${result_expansion}
        dd if=/dev/zero of=$created_file_name bs=${size_file}M count=3
        echo "$created_file_name - $name_file_date - ${size_file}M" >> file_creater.log
        # echo "k=$k m=$m n=$n"
    done
}

function generation_files {
    if [[ $MY_SPACE -ge 1 ]]
    then
        # script execution
        echo "|||||||||||||| GEN FOLDERS ||||||||||||||||||"
        # for {name} generation script
        # echo $name_folder_date
        for (( l=1; l <= $count_folders; l++ ))
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
                    # получаем 0 или 1
                    # 1 1
                    # 2 10
                    # 3 11
                    # 4 100
                    # 5 101
                    # 6 110
                    # 7 111
                    # i = i + 1
                    # i = i * 10
                    # i = i + 1
                    # i = i * 10
                    # i = i + 1

                    az_lenght=$(( RANDOM%2 ))
                    if [[ $az_lenght -eq 0 ]]
                    then
                        name_folder="${name_folder}a"
                    else
                        name_folder="${name_folder}z"
                    fi
                    result_name=$name_folder
                done
            done
            mkdir $path/${result_name}_${name_folder_date}

            #echo "|||||||||||||| GEN FILES ||||||||||||||||||"
            new_folder_path=$path/${result_name}_${name_folder_date}
            file_creater
            #echo "l=$l i=$i j=$j"
        done
    else
        echo "Error: Host space less then 1 Gb"
    fi
}

if [ $# -gt 0 ]
then
	time_end=$(date +%s)
    # script
    echo "Space available = $MY_SPACE"
    generation_files

else
	echo "Error: the Script should have parameters!"
fi

ls -la