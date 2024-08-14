//test server
#include <fcgi_stdio.h>
#include <stdlib.h>

int main(void) {
    while (FCGI_Accept() >= 0) {
        printf("Content-type: text/html\r\n\r\n");
        printf("<html><body><h1>Hello World!</h1></body></html>");
    }
    return 0;
}
