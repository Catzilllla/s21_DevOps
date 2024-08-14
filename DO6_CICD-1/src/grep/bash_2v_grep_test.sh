echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| GREP    |||||||||||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 1st iteration    ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep reflect 10_1.file 10_2.file =="
grep "tr" test_files/grep_test1.txt test_files/grep_test2.txt > standart_grep.log
./s21_grep "tr" test_files/grep_test1.txt test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep reflect 10_1.file 10_2.file =="
grep "tr" test_files/grep_test2.txt test_files/grep_test3.txt > standart_grep.log
./s21_grep "tr" test_files/grep_test2.txt test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep reflect 10_1.file 10_2.file =="
grep "tr" test_files/grep_test3.txt test_files/grep_test4.txt > standart_grep.log
./s21_grep "tr" test_files/grep_test3.txt test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep reflect 10_1.file 10_2.file =="
grep "tr" test_files/grep_test4.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep "tr" test_files/grep_test4.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep reflect 10_1.file 10_2.file =="
grep "tr" test_files/grep_patterns.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep "tr" test_files/grep_patterns.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 2nd iteration -i ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep -i trulyalya 11.file  =="
grep -i "iNt" test_files/grep_test1.txt > standart_grep.log
./s21_grep -i "iNt" test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep -i trulyalya 11.file  =="
grep -i "iNt" test_files/grep_test2.txt > standart_grep.log
./s21_grep -i "iNt" test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep -i trulyalya 11.file  =="
grep -i "iNt" test_files/grep_test3.txt > standart_grep.log
./s21_grep -i "iNt" test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep -i trulyalya 11.file  =="
grep -i "iNt" test_files/grep_test4.txt > standart_grep.log
./s21_grep -i "iNt" test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep -i trulyalya 11.file  =="
grep -i "iNt" test_files/grep_patterns.txt > standart_grep.log
./s21_grep -i "iNt" test_files/grep_patterns.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 3rd iteration -v ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep -v s 12.file  =="
grep -v "tr" test_files/grep_test1.txt > standart_grep.log
./s21_grep -v "tr" test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep -v s 12.file  =="
grep -v "tr" test_files/grep_test2.txt > standart_grep.log
./s21_grep -v "tr" test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep -v s 12.file  =="
grep -v "tr" test_files/grep_test3.txt > standart_grep.log
./s21_grep -v "tr" test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep -v s 12.file  =="
grep -v "tr" test_files/grep_test4.txt > standart_grep.log
./s21_grep -v "tr" test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep -v s 12.file  =="
grep -v "tr" test_files/grep_patterns.txt > standart_grep.log
./s21_grep -v "tr" test_files/grep_patterns.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 4th iteration -c ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == /s21_grep -c s 13.file  =="
grep -c "tr" test_files/grep_test1.txt > standart_grep.log
./s21_grep -c "tr" test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == /s21_grep -c s 13.file  =="
grep -c "tr" test_files/grep_test2.txt > standart_grep.log
./s21_grep -c "tr" test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == /s21_grep -c s 13.file  =="
grep -c "tr" test_files/grep_test3.txt > standart_grep.log
./s21_grep -c "tr" test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == /s21_grep -c s 13.file  =="
grep -c "tr" test_files/grep_test4.txt > standart_grep.log
./s21_grep -c "tr" test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == /s21_grep -c s 13.file  =="
grep -c "tr" test_files/grep_patterns.txt > standart_grep.log
./s21_grep -c "tr" test_files/grep_patterns.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 5th iteration -l ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep -l s 14_1.file 14_2.file 14_3.file  =="
grep -l "tr" test_files/grep_test1.txt test_files/grep_test2.txt test_files/grep_test3.txt > standart_grep.log
./s21_grep -l "tr" test_files/grep_test1.txt test_files/grep_test2.txt test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep -l s 14_1.file 14_2.file 14_3.file  =="
grep -l "tr" test_files/grep_test3.txt test_files/grep_test1.txt test_files/grep_test2.txt > standart_grep.log
./s21_grep -l "tr" test_files/grep_test3.txt test_files/grep_test1.txt test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep -l s 14_1.file 14_2.file 14_3.file  =="
grep -l "tr" test_files/grep_test2.txt test_files/grep_test3.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep -l "tr" test_files/grep_test2.txt test_files/grep_test3.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep -l s 14_1.file 14_2.file 14_3.file  =="
grep -l "tr" test_files/grep_patterns.txt test_files/grep_test3.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep -l "tr" test_files/grep_patterns.txt test_files/grep_test3.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 6th iteration -n ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == /s21_grep -c s 13.file  =="
grep -n "tr" test_files/grep_test1.txt > standart_grep.log
./s21_grep -n "tr" test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == /s21_grep -c s 13.file  =="
grep -n "tr" test_files/grep_test2.txt > standart_grep.log
./s21_grep -n "tr" test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == /s21_grep -c s 13.file  =="
grep -n "tr" test_files/grep_test3.txt > standart_grep.log
./s21_grep -n "tr" test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == /s21_grep -c s 13.file  =="
grep -n "tr" test_files/grep_test4.txt > standart_grep.log
./s21_grep -n "tr" test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == /s21_grep -c s 13.file  =="
grep -n "tr" test_files/grep_patterns.txt > standart_grep.log
./s21_grep -n "tr" test_files/grep_patterns.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 7th iteration -o ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep -o 123 16.file =="
grep -o "tr" test_files/grep_test1.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep -o 123 16.file =="
grep -o "tr" test_files/grep_test2.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep -o 123 16.file =="
grep -o "tr" test_files/grep_test3.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep -o 123 16.file =="
grep -o "tr" test_files/grep_test4.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep -o 123 16.file =="
grep -o "tr" test_files/grep_patterns.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_patterns.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 8th iteration -h ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep -h reflect 17_1.file 17_2.file =="
grep -h "tr" test_files/grep_test1.txt test_files/grep_test2.txt > standart_grep.log
./s21_grep -h "tr" test_files/grep_test1.txt test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep -h reflect 17_1.file 17_2.file =="
grep -h "tr" test_files/grep_test2.txt test_files/grep_test3.txt > standart_grep.log
./s21_grep -h "tr" test_files/grep_test2.txt test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep -h reflect 17_1.file 17_2.file =="
grep -h "tr" test_files/grep_test3.txt test_files/grep_test4.txt > standart_grep.log
./s21_grep -h "tr" test_files/grep_test3.txt test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep -h reflect 17_1.file 17_2.file =="
grep -h "tr" test_files/grep_test4.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep -h "tr" test_files/grep_test4.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep -h reflect 17_1.file 17_2.file =="
grep -h "tr" test_files/grep_patterns.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep -h "tr" test_files/grep_patterns.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 9th iteration -s ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep grep -s 123123 =="
grep -o "tr" test_files/grep_test11.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test11.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep grep -s 123123 =="
grep -o "tr" test_files/grep_test22.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test22.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep grep -s 123123 =="
grep -o "tr" test_files/grep_test33.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test33.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep grep -s 123123 =="
grep -o "tr" test_files/grep_test44.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_test44.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep grep -s 123123 =="
grep -o "tr" test_files/grep_patterns5.txt > standart_grep.log
./s21_grep -o "tr" test_files/grep_patterns5.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log


echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 10t iteration  -f |||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1: == s21_grep reflect 10_1.file 10_2.file =="
grep -f test_files/grep_test1.txt test_files/grep_test2.txt > standart_grep.log
./s21_grep -f test_files/grep_test1.txt test_files/grep_test2.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 2: == s21_grep reflect 10_1.file 10_2.file =="
grep -f test_files/grep_test2.txt test_files/grep_test3.txt > standart_grep.log
./s21_grep -f test_files/grep_test2.txt test_files/grep_test3.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 3: == s21_grep reflect 10_1.file 10_2.file =="
grep -f test_files/grep_test3.txt test_files/grep_test4.txt > standart_grep.log
./s21_grep -f test_files/grep_test3.txt test_files/grep_test4.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 4: == s21_grep reflect 10_1.file 10_2.file =="
grep -f test_files/grep_test4.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep -f test_files/grep_test4.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||||||| FILE 5: == s21_grep reflect 10_1.file 10_2.file =="
grep -f test_files/grep_patterns.txt test_files/grep_test1.txt > standart_grep.log
./s21_grep -f test_files/grep_patterns.txt test_files/grep_test1.txt > mine_grep.log
diff -s standart_grep.log mine_grep.log




# s21_grep -in trulyalya 20.file

# s21_grep -cv s 21.file

# s21_grep -iv s 22.file

# s21_grep -lv s 23_1.file 23_2.file 23_3.file

# s21_grep -ho reflect 24_1.file 24_2.file

# s21_grep -nf 25_1.file 25_2.file