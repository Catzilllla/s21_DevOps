#include <pthread.h> 
#include <sys/types.h> 
#include <stdio.h> 

#include "fcgi_config.h" 
#include "fcgiapp.h"
#include <unistd.h>

#define THREAD_COUNT 8 
#define SOCKET_PATH "127.0.0.1:8080" 

//хранит дескриптор открытого сокета
// gcc fcgi_server.c -lfcgi -lpthread -o start_fcgi
// spawn-fcgi -p 8080 -n start_fcgi

static int socketId; 

static void *doit(void *a) 
{ 
    int rc, i; 
    FCGX_Request request; 
    char *server_name; 

    if(FCGX_InitRequest(&request, socketId, 0) != 0) 
    { 
	    //ошибка при инициализации структуры запроса 
        printf("Can not init request\n"); 
	    return NULL; 
    } 
    printf("Request is inited\n"); 
 
    for(;;) 
    { 
        static pthread_mutex_t accept_mutex = PTHREAD_MUTEX_INITIALIZER; 

        //попробовать получить новый запрос 
        printf("Try to accept new request\n"); 
        pthread_mutex_lock(&accept_mutex); 
        rc = FCGX_Accept_r(&request); 
        pthread_mutex_unlock(&accept_mutex); 

        if(rc < 0) 
        { 
	        //ошибка при получении запроса 
            printf("Can not accept new request\n"); 
            break; 
        } 
        printf("request is accepted\n"); 

        //получить значение переменной 
        server_name = FCGX_GetParam("SERVER_NAME", request.envp); 

        //вывести все HTTP-заголовки (каждый заголовок с новой строки) 
        FCGX_PutS("Content-type: text/html\r\n", request.out); 
        //между заголовками и телом ответа нужно вывести пустую строку 
        FCGX_PutS("\r\n", request.out); 
        //вывести тело ответа (например - html-код веб-страницы) 
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

        //"заснуть" - имитация многопоточной среды 
        // sleep(2);

        //закрыть текущее соединение 
        FCGX_Finish_r(&request); 
        
        //завершающие действия - запись статистики, логгирование ошибок и т.п. 
    } 
 
    return NULL; 
} 

int main(void) 
{ 
    int i; 
    pthread_t id[THREAD_COUNT]; 

    //инициализация библилиотеки 
    FCGX_Init(); 
    printf("Lib is inited\n"); 
    
    //открываем новый сокет 
    socketId = FCGX_OpenSocket(SOCKET_PATH, 20); 
    if(socketId < 0) 
    { 
	    //ошибка при открытии сокета 
	    return 1; 
    } 
    printf("Socket is opened\n"); 

    //создаём рабочие потоки 
    for(i = 0; i < THREAD_COUNT; i++) 
    { 
        pthread_create(&id[i], NULL, doit, NULL); 
    } 
    
    //ждем завершения рабочих потоков 
    for(i = 0; i < THREAD_COUNT; i++) 
    { 
        pthread_join(id[i], NULL); 
    } 

    return 0; 
}
