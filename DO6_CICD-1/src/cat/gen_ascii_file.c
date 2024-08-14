// "r" — открыть файл для чтения (файл должен существовать);
// "w" — открыть пустой файл для записи; если файл существует, то его содержимое
// теряется; "a" — открыть файл для записи в конец (для добавления); файл
// создается, если он не существует; "r+" — открыть файл для чтения и записи
// (файл должен существовать); "w+" — открыть пустой файл для чтения и записи;
// если файл существует, то его содержимое теряется; "a+" — открыть файл для
// чтения и дополнения, если файл не существует, то он создаётся.

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv) {
  FILE* create_file;
  int index, fifth = 0;
  char name_file[] = "test_cat_1.txt";
  char buffer[4096];

  if ((create_file = fopen(name_file, "w")) != NULL) {
    for (index = 0; index < 50; fifth = 0, index++) {
      // if (0 < index < 33) {
      //     if (0 < index < 10) {
      //         fprintf(create_file, " %2d = %s", index, "_");
      //     }
      //     else fprintf(create_file, " %d = %s", index, "_");
      // }
      fprintf(create_file, " %d = %c", index, index);
      fifth = fifth + 50;
      fprintf(create_file, " %20d = %c", index + fifth, index + fifth);
      fifth = fifth + 50;
      fprintf(create_file, " %20d = %c", index + fifth, index + fifth);
      fifth = fifth + 50;
      fprintf(create_file, " %20d = %c", index + fifth, index + fifth);
      fifth = fifth + 50;
      fprintf(create_file, " %20d = %c", index + fifth, index + fifth);
      fprintf(create_file, "%s", "\n");
    }
  } else
    printf("Cant create this file!");
}