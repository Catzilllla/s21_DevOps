# leaks -atExit -- ./s21_grep "return" test_files/test_1_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -i "RetUrn" test_files/test_1_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -v "RetUrn" test_files/test_1_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -c "RetUrn" test_files/test_1_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -l "int" test_files/test_1_grep.txt test_files/test_2_grep.txt test_files/test_3_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -n "RetUrn" test_files/test_1_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -o "RetUrn" test_files/test_1_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep -h "int" test_files/test_1_grep.txt test_files/test_2_grep.txt | grep LEAK:
# leaks -atExit -- ./s21_grep grep -s 123123 | grep LEAK:
# leaks -atExit -- ./s21_grep -f test_files/test_1_grep.txt test_files/test_2_grep.txt | grep LEAK:

# s21_grep -in trulyalya 20.file

# s21_grep -cv s 21.file

# s21_grep -iv s 22.file

# s21_grep -lv s 23_1.file 23_2.file 23_3.file

# s21_grep -ho reflect 24_1.file 24_2.file

# s21_grep -nf 25_1.file 25_2.file
echo "||||||||||||||||||| - 1 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep "return" test_files/test_1_grep.txt

echo "||||||||||||||||||| - 2 echo -i |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -i "RetUrn" test_files/test_1_grep.txt

echo "||||||||||||||||||| - 3 echo -v |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -v "RetUrn" test_files/test_1_grep.txt

echo "||||||||||||||||||| - 4 echo -c |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -c "RetUrn" test_files/test_1_grep.txt

echo "||||||||||||||||||| - 5 echo -l |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -l "int" test_files/test_1_grep.txt test_files/test_2_grep.txt test_files/test_3_grep.txt

echo "||||||||||||||||||| - 6 echo -n |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -n "RetUrn" test_files/test_1_grep.txt

echo "||||||||||||||||||| - 7 echo -o |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -o "RetUrn" test_files/test_1_grep.txt

echo "||||||||||||||||||| - 8 echo -h |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -h "int" test_files/test_1_grep.txt test_files/test_2_grep.txt

echo "||||||||||||||||||| - 9 echo -s |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep grep -s 123123

echo "||||||||||||||||||| - 10 echo -f |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -f test_files/test_1_grep.txt test_files/test_2_grep.txt

echo "||||||||||||||||||| - 11 echo -in |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -in "int" test_files/test_2_grep.txt

echo "||||||||||||||||||| - 12 echo -cv |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -cv "int" test_files/test_2_grep.txt

echo "||||||||||||||||||| - 10 echo -iv |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -iv "int" test_files/test_2_grep.txt

echo "||||||||||||||||||| - 14 echo -lv |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_grep -lv "int" test_files/test_2_grep.txt

