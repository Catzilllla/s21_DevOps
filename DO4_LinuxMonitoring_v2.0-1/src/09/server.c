#include <fcgi_stdio.h>
#include <stdlib.h>

//хранит дескриптор открытого сокета
// gcc fcgi_server.c -lfcgi -lpthread -o start_fcgi
// spawn-fcgi -p 8080 -n start_fcgi

int main(void){
    while (FCGI_Accept() >= 0) {
        printf("# HELP cpu_usage_seconds CPU usage in seconds");
        printf("# TYPE cpu_usage_seconds gauge");
        printf("cpu_usage_seconds{job=node,instance=localhost:9100} 0.5");
        printf("# HELP memory_bytes Memory usage in bytes");
        printf("# TYPE memory_bytes gauge");
        printf("memory_bytes{job=node,instance=localhost:9100} 1024");
        printf("# HELP disk_capacity_bytes Disk capacity in bytes");
        printf("# TYPE disk_capacity_bytes gauge");
        printf("disk_capacity_bytes{job=node,instance=localhost:9100} 1073741824");
    }
    return 0;
}
