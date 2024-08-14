#! /bin/bash

SUCCESS=0
FAILURE=0
COUNTER=0
DIFFERENCE=""

my_grep=(
    "./s21_grep"
)

default_grep=(
    "grep"
)

flags=(
    "i"
    "v"
    "c"
    "l"
    "n"
    "h"
    "s"
    "o"
)

tests=(
"s My_Tests/grep_test1.txt FLAGS"
"for s21_grep.c grep_parser.h Makefile FLAGS"
"for s21_grep.c FLAGS"
"-e for -e ^int s21_grep.c grep_parser.h Makefile FLAGS"
"-e for -e ^int s21_grep.c FLAGS"
"-e regex -e ^print s21_grep.c FLAGS -f My_Tests/grep_patterns.txt"
"-e while -e void s21_grep.c Makefile FLAGS -f My_Tests/grep_patterns.txt"
"-e like -e li FLAGS My_Tests/grep_test4.txt"
"-e li -e like FLAGS My_Tests/grep_test4.txt"
)

standart_tests=(
"-n for My_Tests/grep_test1.txt My_Tests/grep_test2.txt"
"-n for My_Tests/grep_test1.txt"
"-n -e ^\} My_Tests/grep_test3.txt"
"-c -e \/ My_Tests/grep_test3.txt"
"-ce ^print My_Tests/grep_test1.txt My_Tests/grep_test2.txt My_Tests/grep_test3.txt"
"-e ^print My_Tests/grep_test3.txt"
"-nivh = My_Tests/grep_test1.txt My_Tests/grep_test2.txt"
"-e"
"-ie PrInT My_Tests/grep_test3.txt"
"-echar My_Tests/grep_test1.txt My_Tests/grep_test2.txt My_Tests/grep_test3.txt My_Tests/grep_test4.txt"
"-ne = -e out s21_grep.c"
"-iv int s21_grep.c"
"-in int s21_grep.c"
"-c -l aboba My_Tests/grep_test1.txt My_Tests/grep_test2.txt My_Tests/grep_test3.txt My_Tests/grep_test4.txt"
"-v My_Tests/grep_test1.txt -e ank"
"-noe ) s21_grep.c"
"-l for My_Tests/grep_test1.txt My_Tests/grep_test2.txt My_Tests/grep_test3.txt My_Tests/grep_test4.txt s21_grep.c"
"-o -e int s21_grep.c"
"-e = -e out s21_grep.c"
"-noe ing -e as -e the -e not -e is My_Tests/grep_test2.txt"
"-e ing -e as -e the -e not -e is My_Tests/grep_test2.txt"
"-c -e . My_Tests/grep_test3.txt -e '.'"
"-l for no_file.txt My_Tests/grep_test2.txt"
"-e int -si no_file.txt s21_grep.c no_file2.txt grep_parser.h"
"-si s21_grep.c -f no_pattern.txt"
"-f My_Tests/grep_patterns.txt My_Tests/grep_test3.txt My_Tests/grep_test4.txt"
)


run_tests() {
    parameter=$( echo "$@" | sed "s/FLAGS/$variable/" )
    "${default_grep}" $parameter > "${default_grep}".log
    "${my_grep}" $parameter > "${my_grep}".log
    DIFFERENCE=$( diff -s "${my_grep}".log "${default_grep}".log )
    let "COUNTER++"
    if [ "$DIFFERENCE" == "Files "${my_grep}".log and "${default_grep}".log are identical" ]
    then
        let "SUCCESS++"
        echo "$COUNTER - Success (Test: "$parameter")" >> testing_results.log
    else
        let "FAILURE++"
        echo "$COUNTER - Fail (Test: "$parameter")" >> testing_results.log
    fi
}


echo "                  AUTO TESTING                     " >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "                  SIMPLE TESTS                     " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for i in "${standart_tests[@]}"
do
    variable="-"
    run_tests "$i"
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "              TESTS WITH 1 PARAMETER               " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for flag1 in "${flags[@]}"
do
    for i in "${tests[@]}"
    do
        variable="-$flag1"
        run_tests "$i"
    done
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "              TESTS WITH 2 PARAMETERS              " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for flag1 in "${flags[@]}"
do
    for flag2 in "${flags[@]}"
    do
        if [ $flag1 != $flag2 ]
        then
            for i in "${tests[@]}"
            do
                variable="-$flag1 -$flag2"
                run_tests "$i"
            done
        fi
    done
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "              TESTS WITH 3 PARAMETERS              " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for flag1 in "${flags[@]}"
do
    for flag2 in "${flags[@]}"
    do
        for flag3 in "${flags[@]}"
        do
            if [ $flag1 != $flag2 ] && [ $flag1 != $flag3 ] && [ $flag2 != $flag3 ]
            then
                for i in "${tests[@]}"
                do
                    variable="-$flag1 -$flag2 -$flag3"
                    run_tests "$i"
                done
            fi
        done
    done
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "           TESTS WITH 2 MERGED PARAMETERS          " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for flag1 in "${flags[@]}"
do
    for flag2 in "${flags[@]}"
    do
        if [ $flag1 != $flag2 ]
        then
            for i in "${tests[@]}"
            do
                variable="-$flag1$flag2"
                run_tests "$i"
            done
        fi
    done
done

echo "              AUTO TESTING COMPLETE                " >> testing_results.log
echo "###################################################" >> testing_results.log
echo "Success - $SUCCESS                                 " >> testing_results.log
echo "Failed - $FAILURE                                  " >> testing_results.log
echo "All - $COUNTER                                     " >> testing_results.log
echo "###################################################" >> testing_results.log

echo "              AUTO TESTING COMPLETE                "
echo "###################################################"
echo "Success - $SUCCESS                                 "
echo "Failed - $FAILURE                                  "
echo "All - $COUNTER                                     "
echo "###################################################"
echo "You can check all tests in testing_results.log file"

rm "${default_cat}".log "${my_cat}".log