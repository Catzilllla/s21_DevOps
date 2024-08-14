#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// int main(int argc, char* argv[]) {
//     char* str_symb = "645645746dsfhdsfd.2323dsfd";
//     int num = 0;
//     num = atoi(str_symb);
//     printf("%d\n", num);
//     return 0;
// }

int main(int argc, char* argv[]) {
  int i, k;
  printf("Count arguments include name .o file = %d \n\n", argc);

  for (i = 0; i < argc; i++) {
    k = 0;
    printf("Argument #%d: ", i);
    while (argv[i][k]) {
      putchar(argv[i][k]);
      k++;
    }
    printf("\n");
  }
  printf("\n|||||||||||||||||||||\n");
  int s = 10;
  printf("%c", (char)s);
}

/*
int main(int argc, char* argv[]) {
    // int a1 = atoi(argv[1]);
    // int a2 = atoi(argv[2]);
    int i = 0;
    char* file_name;

    while(argv[2][i]) {
        file_name[i] = argv[2][i];
        i++;
    }


    printf("File  name = %s\n", file_name);
    // printf(" %d %d \n", a1, a2);
}
*/