echo "|||||||||||||||||||||||||||   1   ||||||||||||||||||||"
echo "1st iteration grep default"
grep "root" test_passwd > standart_grep.log
./s21_grep "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||   2   ||||||||||||||||||||"
echo "2nd iteration grep -i"
grep -i "root" test_passwd > standart_grep.log
./s21_grep -i "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||   3   ||||||||||||||||||||"
echo "3rd iteration grep -v"
grep -v "root" test_passwd > standart_grep.log
./s21_grep -v "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||   4   ||||||||||||||||||||"
echo "4th iteration grep -e"
grep -e "root" test_passwd > standart_grep.log
./s21_grep -e "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||   5   ||||||||||||||||||||"
echo "5th iteration grep -c"
grep -c "root" test_passwd > standart_grep.log
./s21_grep -c "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||   6   ||||||||||||||||||||"
echo "6th iteration grep -n"
grep -n "root" test_passwd > standart_grep.log
./s21_grep -n "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log

echo "|||||||||||||||||||||||||||   7   ||||||||||||||||||||"
echo "7th iteration grep -l"
grep -l "root" test_passwd > standart_grep.log
./s21_grep -l "root" test_passwd > mine_grep.log
diff -s standart_grep.log mine_grep.log
