#! /bin/bash

SUCCESS=0
FAILURE=0
COUNTER=0
DIFFERENCE=""

my_cat="./s21_cat"

default_cat="cat"

flags=(
    "b"
    "t"
    "v"
    "n"
    "s"
    "e"
)

tests=(
    "FLAGS My_tests/test.txt"
    "FLAGS My_tests/test1.txt"
    "FLAGS My_tests/test2.txt"
    "FLAGS My_tests/test4.txt"
    "FLAGS My_tests/test5.txt"
    "FLAGS My_tests/test7.txt"
    "FLAGS My_tests/test1.txt My_tests/test2.txt"
    "FLAGS My_tests/test1.txt My_tests/test4.txt"
    "FLAGS My_tests/test1.txt My_tests/test5.txt"
    "FLAGS My_tests/test1.txt My_tests/test7.txt"
)

standart_tests=(
    "-b.txt My_tests/test1.txt"
    "-- -b.txt My_tests/test1.txt"
    "-b -- -b.txt"
    "-n -- My_tests/test1.txt no_file.txt"
    "-s -- My_tests/test1.txt doesnt_exist.txt"
    "-t -- My_tests/test1.txt dont_have_it.txt -b.txt"
    "-e -- My_tests/test1.txt nope.txt My_tests/test1.txt"
)


run_tests() {
    parameter=$( echo "$@" | sed "s/FLAGS/$variable/" )
    "${default_cat}" $parameter > "${default_cat}".log
    "${my_cat}" $parameter > "${my_cat}".log
    DIFFERENCE=$( diff -s "${my_cat}".log "${default_cat}".log )
    let "COUNTER++"
    if [ "$DIFFERENCE" == "Files "${my_cat}".log and "${default_cat}".log are identical" ]
    then
        let "SUCCESS++"
        echo "$COUNTER - Success (Test: "$parameter")" >> testing_results.log
    else
        let "FAILURE++"
        echo "$COUNTER - Fail (Test: "$parameter")" >> testing_results.log
    fi
}

rm testing_results.log

echo "                  AUTO TESTING                     " >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "                  SIMPLE TESTS                     " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for i in "${standart_tests[@]}"
do
    variable="-"
    run_tests $i
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
        run_tests $i
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
                run_tests $i
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
                    run_tests $i
                done
            fi
        done
    done
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "              TESTS WITH 4 PARAMETERS              " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for flag1 in "${flags[@]}"
do
    for flag2 in "${flags[@]}"
    do
        for flag3 in "${flags[@]}"
        do
            for flag4 in "${flags[@]}"
            do
                if [ $flag1 != $flag2 ] && [ $flag1 != $flag3 ] && [ $flag1 != $flag4 ] && [ $flag3 != $flag2 ] && [ $flag4 != $flag2 ] && [ $flag3 != $flag4 ]
                then
                    for i in "${tests[@]}"
                    do
                        variable="-$flag1 -$flag2 -$flag3 -$flag4"
                        run_tests $i
                    done
                fi
            done
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
                run_tests $i
            done
        fi
    done
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "           TESTS WITH 3 MERGED PARAMETERS          " >> testing_results.log
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
                    variable="-$flag1$flag2$flag3"
                    run_tests $i
                done
            fi
        done
    done
done

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" >> testing_results.log
echo "###################################################" >> testing_results.log
echo "                                                   " >> testing_results.log
echo "           TESTS WITH 4 MERGED PARAMETERS          " >> testing_results.log
echo "                                                   " >> testing_results.log
echo "###################################################" >> testing_results.log
for flag1 in "${flags[@]}"
do
    for flag2 in "${flags[@]}"
    do
        for flag3 in "${flags[@]}"
        do
            for flag4 in "${flags[@]}"
            do
                if [ $flag1 != $flag2 ] && [ $flag1 != $flag3 ] && [ $flag1 != $flag4 ] && [ $flag3 != $flag2 ] && [ $flag4 != $flag2 ] && [ $flag3 != $flag4 ]
                then
                    for i in "${tests[@]}"
                    do
                        variable="-$flag1$flag2$flag3$flag4"
                        run_tests $i
                    done
                fi
            done
        done
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