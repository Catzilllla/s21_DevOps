echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| 1st iteration -b ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -b test_files/test_1_cat.txt"
cat -b test_files/test_1_cat.txt > standart_cat.log
./s21_cat -b test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -b test_files/test_2_cat.txt"
cat -b test_files/test_2_cat.txt > standart_cat.log
./s21_cat -b test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -b test_files/test_3_cat.txt"
cat -b test_files/test_3_cat.txt > standart_cat.log
./s21_cat -b test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -b test_files/test_4_cat.txt"
cat -b test_files/test_4_cat.txt > standart_cat.log
./s21_cat -b test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -b test_files/test_5_cat.txt"
cat -b test_files/test_5_cat.txt > standart_cat.log
./s21_cat -b test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -b test_files/test_6_cat.txt"
cat -b test_files/test_6_cat.txt > standart_cat.log
./s21_cat -b test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -b test_files/test_case_cat.txt"
cat -b test_files/test_case_cat.txt > standart_cat.log
./s21_cat -b test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 2.1st itera -e ||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -e test_files/test_1_cat.txt"
cat -e test_files/test_1_cat.txt > standart_cat.log
./s21_cat -e test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -e test_files/test_2_cat.txt"
cat -e test_files/test_2_cat.txt > standart_cat.log
./s21_cat -e test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -e test_files/test_3_cat.txt"
cat -e test_files/test_3_cat.txt > standart_cat.log
./s21_cat -e test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -e test_files/test_4_cat.txt"
cat -e test_files/test_4_cat.txt > standart_cat.log
./s21_cat -e test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -e test_files/test_5_cat.txt"
cat -e test_files/test_5_cat.txt > standart_cat.log
./s21_cat -e test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -e test_files/test_6_cat.txt"
cat -e test_files/test_6_cat.txt > standart_cat.log
./s21_cat -e test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -e test_files/test_case_cat.txt"
cat -e test_files/test_case_cat.txt > standart_cat.log
./s21_cat -e test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 2.2nd itera -E (без V) ||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -E test_files/test_1_cat.txt"
cat -e test_files/test_1_cat.txt > standart_cat.log
./s21_cat -E test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -E test_files/test_2_cat.txt"
cat -e test_files/test_2_cat.txt > standart_cat.log
./s21_cat -E test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -E test_files/test_3_cat.txt"
cat -e test_files/test_3_cat.txt > standart_cat.log
./s21_cat -E test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -E test_files/test_4_cat.txt"
cat -e test_files/test_4_cat.txt > standart_cat.log
./s21_cat -E test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -E test_files/test_5_cat.txt"
cat -e test_files/test_5_cat.txt > standart_cat.log
./s21_cat -E test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -E test_files/test_6_cat.txt"
cat -e test_files/test_6_cat.txt > standart_cat.log
./s21_cat -E test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -E test_files/test_case_cat.txt"
cat -e test_files/test_case_cat.txt > standart_cat.log
./s21_cat -E test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 3rd itera -n ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -n test_files/test_1_cat.txt"
cat -n test_files/test_1_cat.txt > standart_cat.log
./s21_cat -n test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -n test_files/test_2_cat.txt"
cat -n test_files/test_2_cat.txt > standart_cat.log
./s21_cat -n test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -n test_files/test_3_cat.txt"
cat -n test_files/test_3_cat.txt > standart_cat.log
./s21_cat -n test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -n test_files/test_4_cat.txt"
cat -n test_files/test_4_cat.txt > standart_cat.log
./s21_cat -n test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -n test_files/test_5_cat.txt"
cat -n test_files/test_5_cat.txt > standart_cat.log
./s21_cat -n test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -n test_files/test_6_cat.txt"
cat -n test_files/test_6_cat.txt > standart_cat.log
./s21_cat -n test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -n test_files/test_case_cat.txt"
cat -n test_files/test_case_cat.txt > standart_cat.log
./s21_cat -n test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 4th itera -s ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -s test_files/test_1_cat.txt"
cat -s test_files/test_1_cat.txt > standart_cat.log
./s21_cat -s test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -s test_files/test_2_cat.txt"
cat -s test_files/test_2_cat.txt > standart_cat.log
./s21_cat -s test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -s test_files/test_3_cat.txt"
cat -s test_files/test_3_cat.txt > standart_cat.log
./s21_cat -s test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -s test_files/test_4_cat.txt"
cat -s test_files/test_4_cat.txt > standart_cat.log
./s21_cat -s test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -s test_files/test_5_cat.txt"
cat -s test_files/test_5_cat.txt > standart_cat.log
./s21_cat -s test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -s test_files/test_6_cat.txt"
cat -s test_files/test_6_cat.txt > standart_cat.log
./s21_cat -s test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -s test_files/test_case_cat.txt"
cat -s test_files/test_case_cat.txt > standart_cat.log
./s21_cat -s test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 5.1th itera -t ||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -t test_files/test_1_cat.txt"
#cat -t test_files/test_1_cat.txt > standart_cat.log
#./s21_cat -t test_files/test_1_cat.txt > mine_cat.log
#diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -t test_files/test_2_cat.txt"
cat -t test_files/test_2_cat.txt > standart_cat.log
./s21_cat -t test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -t test_files/test_3_cat.txt"
cat -t test_files/test_3_cat.txt > standart_cat.log
./s21_cat -t test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -t test_files/test_4_cat.txt"
cat -t test_files/test_4_cat.txt > standart_cat.log
./s21_cat -t test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -t test_files/test_5_cat.txt"
cat -t test_files/test_5_cat.txt > standart_cat.log
./s21_cat -t test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -t test_files/test_6_cat.txt"
cat -t test_files/test_6_cat.txt > standart_cat.log
./s21_cat -t test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -t test_files/test_case_cat.txt"
cat -t test_files/test_case_cat.txt > standart_cat.log
./s21_cat -t test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 5.2th itera -T (без -v) |||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -T test_files/test_1_cat.txt"
cat -t test_files/test_1_cat.txt > standart_cat.log
./s21_cat -T test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -T test_files/test_2_cat.txt"
cat -t test_files/test_2_cat.txt > standart_cat.log
./s21_cat -T test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -T test_files/test_3_cat.txt"
cat -t test_files/test_3_cat.txt > standart_cat.log
./s21_cat -T test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -T test_files/test_4_cat.txt"
cat -t test_files/test_4_cat.txt > standart_cat.log
./s21_cat -T test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -T test_files/test_5_cat.txt"
cat -t test_files/test_5_cat.txt > standart_cat.log
./s21_cat -T test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -T test_files/test_6_cat.txt"
cat -t test_files/test_6_cat.txt > standart_cat.log
./s21_cat -T test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -T test_files/test_case_cat.txt"
cat -t test_files/test_case_cat.txt > standart_cat.log
./s21_cat -T test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 6.1th itera -vE |||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -vE test_files/test_1_cat.txt"
cat -e test_files/test_1_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -vE test_files/test_2_cat.txt"
cat -e test_files/test_2_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -vE test_files/test_3_cat.txt"
cat -e test_files/test_3_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -vE test_files/test_4_cat.txt"
cat -e test_files/test_4_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -vE test_files/test_5_cat.txt"
cat -e test_files/test_5_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -vE test_files/test_6_cat.txt"
cat -e test_files/test_6_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -vE test_files/test_case_cat.txt"
cat -e test_files/test_case_cat.txt > standart_cat.log
./s21_cat -vE test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 6.2th itera -vT |||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -vT test_files/test_1_cat.txt"
cat -t test_files/test_1_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_1_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -vT test_files/test_2_cat.txt"
cat -t test_files/test_2_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -vT test_files/test_3_cat.txt"
cat -t test_files/test_3_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -vT test_files/test_4_cat.txt"
cat -t test_files/test_4_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -vT test_files/test_5_cat.txt"
cat -t test_files/test_5_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -vT test_files/test_6_cat.txt"
cat -t test_files/test_6_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -vT test_files/test_case_cat.txt"
cat -t test_files/test_case_cat.txt > standart_cat.log
./s21_cat -vT test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| end 7th itera -v ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "|||||||||||||||||||||||||||||||| FILE 1:cat -v test_files/test_1_cat.txt"
#cat -v test_files/test_1_cat.txt > standart_cat.log
#./s21_cat -v test_files/test_1_cat.txt > mine_cat.log
#diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 2:cat -v test_files/test_2_cat.txt"
cat -v test_files/test_2_cat.txt > standart_cat.log
./s21_cat -v test_files/test_2_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 3:cat -v test_files/test_3_cat.txt"
cat -v test_files/test_3_cat.txt > standart_cat.log
./s21_cat -v test_files/test_3_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 4:cat -v test_files/test_4_cat.txt"
cat -v test_files/test_4_cat.txt > standart_cat.log
./s21_cat -v test_files/test_4_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 5:cat -v test_files/test_5_cat.txt"
cat -v test_files/test_5_cat.txt > standart_cat.log
./s21_cat -v test_files/test_5_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 6:cat -v test_files/test_6_cat.txt"
cat -v test_files/test_6_cat.txt > standart_cat.log
./s21_cat -v test_files/test_6_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "|||||||||||||||||||||||||||||||| FILE 7:cat -v test_files/test_case_cat.txt"
cat -v test_files/test_case_cat.txt > standart_cat.log
./s21_cat -v test_files/test_case_cat.txt > mine_cat.log
diff -s standart_cat.log mine_cat.log

echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| END OF TESTS ||||||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
