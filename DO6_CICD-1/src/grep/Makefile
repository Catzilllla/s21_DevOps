CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

build:
	$(CC) $(CFLAGS) main_grep_1_2.c parser_arguments.c option_grep_func.c -o s21_grep

run:
	$(shell ./bash_grep_test.sh)

clean:
	rm -rf s21_cat
	rm -rf log.txt
	rm -rf .clang-format

test:
	chmod +x bash_2v_grep_test.sh
	./bash_2v_grep_test.sh

style:
	clang-format --style=Google *.c *.h

style-edit:
	clang-format -i --style=Google *.c *.h

rebuild:
	$(MAKE) clean


.PHONY: build run clean rebuild
