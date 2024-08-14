CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

s21_cat:
	$(CC) $(CFLAGS) main_1_3.c parser_arguments.c option_func.c -o s21_cat

run:
	$(shell ./bash_cat_test.sh)

test:
	chmod +x bash_cat_test.sh
	./bash_cat_test.sh

clean:
	rm -rf s21_cat
	rm -rf log.txt
	rm -rf .clang-format

style:
	clang-format --style=Google *.c *.h

style-edit:
	clang-format -i --style=Google *.c *.h

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem s21_cat.c *.c *.h

rebuild:
	$(MAKE) clean


.PHONY: build run clean rebuild
