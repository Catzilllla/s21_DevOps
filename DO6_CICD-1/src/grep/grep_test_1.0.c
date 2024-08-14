#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LEN 1024

int main(int argc, char *argv[]) {
  FILE *fp;
  char line[MAX_LINE_LEN];
  regex_t regex;
  int ret;

  if (argc < 2) {
    printf("Usage: %s <pattern> [<file>]\n", argv[0]);
    return 1;
  }

  ret = regcomp(&regex, argv[1], REG_EXTENDED);
  if (ret != 0) {
    printf("Failed to compile regular expression\n");
    return 1;
  }

  // считываем из потока и проверяет grep pattern  в нём
  if (argc == 2) {
    while (fgets(line, MAX_LINE_LEN, stdin)) {
      if (regexec(&regex, line, 0, NULL, 0) == 0) {
        printf("%s", line);
      }
    }
  } else {
    fp = fopen(argv[2], "r");
    if (fp == NULL) {
      printf("Failed to open file: %s\n", argv[2]);
      return 1;
    }

    while (fgets(line, MAX_LINE_LEN, fp)) {
      if (regexec(&regex, line, 0, NULL, 0) == 0) {
        printf("%s", line);
      }
    }

    fclose(fp);
  }

  regfree(&regex);

  return 0;
}
