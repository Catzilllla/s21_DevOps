#include <fcgi_stdio.h>
#include <stdlib.h>

//хранит дескриптор открытого сокета
// gcc fcgi_server.c -lfcgi -lpthread -o start_fcgi
// spawn-fcgi -p 8080 -n start_fcgi

int main(void){
    while (FCGI_Accept() >= 0) {
        printf("Content-type: text/html\r\nStatus: 200 OK\r\n\r\nHello World!");
    }
    return 0;
}