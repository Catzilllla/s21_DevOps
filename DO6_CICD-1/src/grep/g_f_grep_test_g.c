#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void grep_file(const char *file1_name, const char *file2_name,
               const char *pattern) {
  FILE *file1 = fopen(file1_name, "r");
  if (file1 == NULL) {
    perror("Could not open file1");
    return;
  }

  FILE *file2 = fopen(file2_name, "r");
  if (file2 == NULL) {
    perror("Could not open file2");
    fclose(file1);
    return;
  }

  char *line = NULL;
  size_t len = 0;
  ssize_t read;

  regex_t regex;
  if (regcomp(&regex, pattern, REG_EXTENDED) != 0) {
    perror("Could not compile regular expression");
    fclose(file1);
    fclose(file2);
    return;
  }

  while ((read = getline(&line, &len, file1)) != -1) {
    // Remove newline character from read string
    if (line[read - 1] == '\n') {
      line[read - 1] = '\0';
    }

    // Match pattern against line
    if (regexec(&regex, line, 0, NULL, 0) == 0) {
      // Match found, print line from file2
      char *line2 = NULL;
      size_t len2 = 0;
      ssize_t read2;

      rewind(file2);
      while ((read2 = getline(&line2, &len2, file2)) != -1) {
        // Remove newline character from read string
        if (line2[read2 - 1] == '\n') {
          line2[read2 - 1] = '\0';
        }

        // Check if line2 matches pattern
        if (regexec(&regex, line2, 0, NULL, 0) == 0) {
          printf("%s\n", line2);
        }
      }

      free(line2);
    }
  }

  free(line);
  regfree(&regex);
  fclose(file1);
  fclose(file2);
}

int main() {
  grep_file("file1.txt", "file2.txt", "pattern");
  return 0;
}

// В этой функции используется библиотека regex.h для работы с регулярными
// выражениями. Сначала открываются файлы file1 и file2, затем компилируется
// регулярное выражение из переданного шаблона. Затем происходит построчное
// чтение файла file1, каждая строка проверяется на соответствие регулярному
// выражению. Если строка соответствует шаблону, происходит построчное чтение
// файла file2 и проверка каждой строки на соответствие регулярному выражению.
// Если строка соответствует шаблону, она выводится в консоль. Выполнение
// функции заканчивается закрытием файлов и освобождением динамически выделенной
// памяти.
