#include "parser.h"

// int main (int argc, char* argv[]) {
//     int a = argc;
//     int* p = &a;
//     int b = 10;

//     // printf("%s", &p);
//     printf(" a = %d\n", a);
//     printf(" b = %d\n", b);
//     printf("int* p = &a | *p = %d\n\n", *p);
//     printf("&a = %p\n", &a);

//     *p = b;
//     printf("*p = b | *p = %d\n", *p);
//     printf("*p = b |  a = %d\n", a);
//     printf("&a = p = %p\n", p);
//     printf("&p = %p\n", &p);
//     // printf("The memory address of a is: %p\n", (void*) &p);
// }

int main(int argc, char* argv[]) {
  int i = 0;
  char* a = argv[0];
  char* p[100];
  printf("\n|||||||||||||  a |||||||||||||||||\n");
  printf("  (s)     a = %s\n", a);
  printf("  (p)    &a = %p\n", a);
}