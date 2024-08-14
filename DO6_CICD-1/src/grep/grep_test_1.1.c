#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void grep(char *pattern, char *filename) {
  FILE *file;
  char *line = NULL;
  size_t len = 0;
  size_t read;
  int line_number = 1;

  // Открыть файл
  file = fopen(filename, "r");
  if (file == NULL) {
    printf("Не удалось открыть файл %s\n", filename);
    exit(1);
  }

  // Прочитать файл по строкам
  while ((read = getline(&line, &len, file)) != -1) {
    char *str = strdup(line);

    // Привести строку к нижнему регистру
    for (int i = 0; i < strlen(str); i++) {
      str[i] = tolower(str[i]);
    }

    // Поиск паттерна в строке
    if (strstr(str, pattern) != NULL) {
      printf("%s:%d:%s", filename, line_number, line);
    }

    free(str);
    line_number++;
  }

  // Закрыть файл и освободить память
  free(line);
  fclose(file);
}

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("Использование: %s паттерн файл\n", argv[0]);
    exit(1);
  }

  char *pattern = strdup(argv[1]);

  // Привести паттерн к нижнему регистру
  for (int i = 0; i < strlen(pattern); i++) {
    pattern[i] = tolower(pattern[i]);
  }

  char *filename = strdup(argv[2]);
  grep(pattern, filename);

  free(pattern);
  free(filename);

  return 0;
}
