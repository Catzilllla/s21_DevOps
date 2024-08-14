// Если вам нужно, чтобы скрипт искал несколько совпадений шаблона в одной
// строке, то можно использовать функцию `regexec` в цикле, чтобы найти все
// совпадения:

#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_MATCHES 10  // максимальное количество совпадений
#define MAX_STR_LEN 1024  // максимальная длина строки

int main(int argc, char *argv[]) {
  if (argc != 3) {
    printf("Использование: ./grep-o pattern file\n");
    exit(1);
  }

  char *pattern = argv[1];
  char *file_name = argv[2];
  char line_buffer[MAX_STR_LEN];  // буфер для текущей строки
  regex_t regex;  // структура регулярного выражения

  // скомпилируем регулярное выражение
  if (regcomp(&regex, pattern, REG_EXTENDED) != 0) {
    printf("Ошибка при компиляции регулярного выражения\n");
    exit(1);
  }

  // откроем файл
  FILE *file = fopen(file_name, "r");
  if (file == NULL) {
    printf("Ошибка при открытии файла\n");
    exit(1);
  }

  // читаем строки из файла и ищем совпадения регулярного выражения
  while (fgets(line_buffer, MAX_STR_LEN, file) != NULL) {
    int match_count = 0;
    regmatch_t matches[MAX_MATCHES];
    char *line_ptr = line_buffer;  // указатель на начало строки

    // ищем совпадения в строке, пока находим новые
    while (regexec(&regex, line_ptr, MAX_MATCHES, matches, 0) == 0) {
      char *match_start = line_ptr + matches[0].rm_so;
      char *match_end = line_ptr + matches[0].rm_eo;
      int match_len = match_end - match_start;

      // выделяем память для результата
      char *match_str = malloc((match_len + 1) * sizeof(char));
      if (match_str == NULL) {
        printf("Ошибка при выделении памяти\n");
        exit(1);
      }

      // копируем совпадение в результат
      strncpy(match_str, match_start, match_len);
      match_str[match_len] = '\0';

      // выводим результат
      printf("%s\n", match_str);

      // освобождаем память
      free(match_str);

      // продвигаем указатель на начало следующего совпадения
      line_ptr = match_end;

      // увеличиваем счетчик совпадений
      match_count++;
    }

    // если не было найдено ни одного совпадения, выведем сообщение об этом
    if (match_count == 0) {
      printf("Совпадений не найдено\n");
    }
  }

  // закрываем файл и освобождаем регулярное выражение
  fclose(file);
  regfree(&regex);

  return 0;
}

// Здесь мы используем цикл `while`, чтобы искать совпадения шаблона в текущей
// строке, пока находим новые совпадения. После нахождения каждого совпадения мы
// обновляем указатель `line_ptr` на начало следующего совпадения, чтобы
// продолжить поиск до конца строки. Если ни одного совпадения не найдено, мы
// выводим сообщение об этом.