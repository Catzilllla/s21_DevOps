echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "|||||||||||||||||||||||||||||||| leaks -atExite   ||||||||||||||||||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

echo "||||||||||||||||||| - 1 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -b test_files/test_2_cat.txt

echo "||||||||||||||||||| - 2 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -e test_files/test_2_cat.txt

echo "||||||||||||||||||| - 3 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -n test_files/test_2_cat.txt

echo "||||||||||||||||||| - 4 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -s test_files/test_2_cat.txt

echo "||||||||||||||||||| - 5 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -t test_files/test_2_cat.txt

echo "||||||||||||||||||| - 6 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -v test_files/test_2_cat.txt

echo "||||||||||||||||||| - 7 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -vE test_files/test_2_cat.txt

echo "||||||||||||||||||| - 8 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -vT test_files/test_2_cat.txt

echo "||||||||||||||||||| - 8 echo |||||||||||||||||||\n\n"
leaks -atExit -- ./s21_cat -T test_files/test_2_cat.txt
