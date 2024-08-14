//test server
#include <pthread.h> 
#include <sys/types.h> 
#include <stdio.h> 

#include "fcgi_config.h" 
#include "fcgiapp.h"
#include <unistd.h>

#define SOCKET_PATH "localhost:8080"

int main() {
    int FCGX_Init();
    int opend_id_socket = FCGX_OpenSocket(SOCKET_PATH, 100);
    if (opend_id_socket < 0) {
        printf("\nFCGX_OpenSocket can't open socket: error -1 .. sry ..\n");
        return 1;
    }
    else
        printf("Socket is opened!\n");
    
    FCGX_Request request;
    char *server_name = NULL;

    if (FCGX_InitRequest(&request, opend_id_socket, 0) != 0) {
        printf("FCGX_Request structure is not initialised .. sry .. \n");
        return 1;
    }
    else
        printf("FCGX_Request structure is initialised!\n");
    
    while(1) {
        printf("Try to accept new request\n");
        if (FCGX_Accept_r(&request) < 0) {
            printf("Some error in FCGX_Accept_r: can't accept new request .. sry ..\n");
            break;
        }
        else
            {
                printf("Request is accepted\n");
                printf("Content-type: text/html\r\nStatus: 200 OK\r\n\r\nHello World!\n\n\n");
                
                server_name = FCGX_GetParam("SERVER_NAME", request.envp);

                FCGX_PutS("Content-type: text/html\r\nStatus: 200 OK\r\n\r\nHello World!\n\n\n\n\n", request.out);
                FCGX_PutS("<html>\r\n", request.out); 
                FCGX_PutS("<head>\r\n", request.out); 
                FCGX_PutS("<title>FastCGI Hello! (multi-threaded C, fcgiapp library)</title>\r\n", request.out); 
                FCGX_PutS("</head>\r\n", request.out); 
                FCGX_PutS("<body>\r\n", request.out); 
                FCGX_PutS("<h1>FastCGI Hello! (multi-threaded C, fcgiapp library)</h1>\r\n", request.out); 
                FCGX_PutS("<p>Request accepted from host <i>", request.out); 
                FCGX_PutS(server_name ? server_name : "?", request.out); 
                FCGX_PutS("</i></p>\r\n", request.out); 
                FCGX_PutS("</body>\r\n", request.out); 
                FCGX_PutS("</html>\r\n", request.out);
        }
        FCGX_Finish_r(&request);
    }
}