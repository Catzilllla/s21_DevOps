#gcc -Wall -Werror -Wextra -Wpedantic -std=c11 -o server server.c -lfcgi
# service nginx start
nginx -s reload
spawn-fcgi -p 8080 ./server
