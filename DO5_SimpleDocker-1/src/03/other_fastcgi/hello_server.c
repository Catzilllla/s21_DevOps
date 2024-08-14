#include <fcgiapp.h>
#include <stdio.h>

#define SOCKET_PATH "127.0.0.1:8080"

int main() {
  FCGX_Init();
  printf("%s", "Lib is inited\n");

  int sockfd = FCGX_OpenSocket(SOCKET_PATH, 100);
  if (sockfd < 0) {
    // ошибка при открытии сокета
    printf("%s", "FCGX_OpenSocket error!\n");
    return 1;
  }
  printf("%s", "Socket is opened\n");

  FCGX_Request req;
  FCGX_InitRequest(&req, sockfd, 0);

  if (FCGX_InitRequest(&req, sockfd, 0) != 0) {
    // ошибка при инициализации структуры запроса
    printf("%s", "Can not init request\n");
    return 1;
  }
  printf("%s", "Request is inited\n");

  while (1) {
    int rc = FCGX_Accept_r(&req);
    if (rc < 0) {
      // ошибка при получении запроса
      printf("Can not accept new request with code %d\n", rc);
      break;
    }

    FCGX_PutS("Content-type: text/html\r\n", req.out);
    FCGX_PutS("\r\n", req.out);
    FCGX_PutS("Hello World!\r\n", req.out);

    FCGX_Finish_r(&req);
  }

  return 0;
}
