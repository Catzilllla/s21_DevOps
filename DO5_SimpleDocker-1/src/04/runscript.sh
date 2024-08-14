#!/bin/bash

gcc -Wall -Werror -Wextra -Wpedantic -std=c11 -o server server.c -lfcgi
# service nginx start
./server
nginx -s reload