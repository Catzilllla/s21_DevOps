#include "parser.h"

// ||||||||||||||||||||||||||||||||||||||||        1
// ||||||||||||||||||||||||||||||||||||||||||| grep search default

void fun_grep_search(char* namefile, char* pattern, FILE* readparser_file,
                     int count_file) {
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
        if (count_file > 1) {
          printf("%s:%s", namefile, str_from_file);
        } else
          printf("%s", str_from_file);
      }
    }
  }
  regfree(&regex);
  fclose(readparser_file);
}

// ||||||||||||||||||||||||||||||||||||||||        2
// ||||||||||||||||||||||||||||||||||||||||||| -e, --regexp pattern

void fun_e_search(char* namefile, char* pattern, FILE* readparser_file,
                  int count_file) {
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    if (count_file > 1) {
      while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
        if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
          printf("%s: %s", namefile, str_from_file);
        }
      }
    } else {
      while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
        if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
          printf("%s", str_from_file);
        }
      }
    }
  }

  regfree(&regex);
  fclose(readparser_file);
}

// ||||||||||||||||||||||||||||||||||||||||        3
// ||||||||||||||||||||||||||||||||||||||||||| -i, --ignore-case - не учитывать
// регистр символов;

void fun_i_ignore_reg(char* namefile, char* pattern, FILE* readparser_file,
                      int count_file) {
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;
  char* lower_pattern = strdup(pattern);
  char* lower_str_from_file = NULL;

  // приводим патерн к нижнему регистру
  for (size_t i = 0; i < strlen(lower_pattern); i++) {
    lower_pattern[i] = tolower(lower_pattern[i]);
  }

  ret = regcomp(&regex, lower_pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      lower_str_from_file = strdup(str_from_file);

      for (size_t i = 0; i < strlen(lower_str_from_file); i++) {
        lower_str_from_file[i] = tolower(lower_str_from_file[i]);
      }

      if (regexec(&regex, lower_str_from_file, 0, NULL, 0) == 0) {
        if (count_file > 1) {
          printf("%s: %s", namefile, str_from_file);
        } else
          printf("%s", str_from_file);
      }
      free(lower_str_from_file);
    }
  }
  regfree(&regex);
  free(lower_pattern);
  fclose(readparser_file);
}

// ||||||||||||||||||||||||||||||||||||||||        4
// ||||||||||||||||||||||||||||||||||||||||||| -v, --invert-match - вывести
// только те строки, в которых шаблон поиска не найден;

void fun_v_invert_pattern(char* namefile, char* pattern, FILE* readparser_file,
                          int count_file) {
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
      } else if (count_file > 1) {
        printf("%s: %s", namefile, str_from_file);
      } else
        printf("%s", str_from_file);
    }
    if (feof(readparser_file) && (strrchr(str_from_file, '\n') == NULL))
      printf("\n");
  }
  regfree(&regex);
  fclose(readparser_file);
}

// ||||||||||||||||||||||||||||||||||||||||        5
// ||||||||||||||||||||||||||||||||||||||||||| -c --count

void fun_c_count_str_accord(char* namefile, char* pattern) {
  FILE* readparser_file;
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;
  int count = 0;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
        count++;
      }
    }
  }
  printf("%d\n", count);
  regfree(&regex);
  fclose(readparser_file);
}

// ||||||||||||||||||||||||||||||||||||||||        6
// ||||||||||||||||||||||||||||||||||||||||||| -l, --files-with-matches печатать
// только имена ФАЙЛОВ с выбранными строками

void fun_l_acoord_files(char* namefile, char* pattern) {
  FILE* readparser_file;
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;
  int flag = 0;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
        flag = 1;
      }
    }
  }

  if (flag == 1) printf("%s\n", namefile);

  regfree(&regex);
  fclose(readparser_file);
}

// ||||||||||||||||||||||||||||||||||||||||        3
// ||||||||||||||||||||||||||||||||||||||||||| -n, --line-number печатать номер
// строки вместе с выходными строками
void fun_n_num_str_search(char* namefile, char* pattern) {
  FILE* readparser_file;
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;
  int count = 0;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      count++;
      if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
        printf("%d:%s", count, str_from_file);
      }
    }
  }
  regfree(&regex);
  fclose(readparser_file);
}

// 3d TASK
// |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

// -h, --no-filename не начинать вывод с имени файла
void fun_h_noname_file(char* namefile, char* pattern) {
  FILE* readparser_file;
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  int ret;

  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  if ((readparser_file = fopen(namefile, "rb")) != NULL) {
    while (fgets(str_from_file, MAX_LINE_LEN, readparser_file)) {
      if (regexec(&regex, str_from_file, 0, NULL, 0) == 0) {
        printf("%s", str_from_file);
      }
    }
  }
  regfree(&regex);
  fclose(readparser_file);
}

// -s, --no-messages         не показывать сообщения об ошибках
// in main

// -f, --file=ФАЙЛ        брать ШАБЛОН из ФАЙЛа
// ---------------------------------------------------------------------------!!!!!!!!!!!!!!
void fun_f_search(char* files[], char* file_arg_2) {
  FILE* file1 = fopen(files[0], "r");
  if (file1 == NULL) {
    perror("Could not open file1\n");
  }

  FILE* file2 = fopen(file_arg_2, "r");
  if (file2 == NULL) {
    perror("Could not open file2\n");
  }

  regex_t regex;
  char str_from_file[MAX_LINE_LEN];
  char str_from_file_2[MAX_LINE_LEN];

  while (fgets(str_from_file, MAX_LINE_LEN, file1)) {
    regcomp(&regex, str_from_file, REG_EXTENDED);
    // printf("\n str_f_f1 = %s", str_from_file);
    while (fgets(str_from_file_2, MAX_LINE_LEN, file2)) {
      int check = 0;
      check = regexec(&regex, str_from_file_2, 0, NULL, 0);
      // printf("%s -- |%d|\n",str_from_file_2, check);
      if (!check) {
        printf("%s", str_from_file_2);
      }
    }
    rewind(file2);
  }
  regfree(&regex);
  fclose(file1);
  fclose(file2);
}

// index++;
//   if (regcomp(&regex, , REG_EXTENDED) != 0) {
//   perror("Could not compile regular expression");
//   fclose(file1);
//   fclose(file2);
//   return;
// }
// printf("\n ==========3======\n");
// while ((read = getline(&line, &len, file1)) != -1) {
//   // Remove newline character from read string
//   if (line[read - 1] == '\n') {
//     line[read - 1] = '\0';
//   }
//   printf("\n ==========4======\n");

//   // Match pattern against line
//   if (regexec(&regex, line, 0, NULL, 0) == 0) {
//     // Match found, print line from file2
//     char* line2 = NULL;
//     size_t len2 = 0;
//     ssize_t read2;

//     rewind(file2);
//     while ((read2 = getline(&line2, &len2, file2)) != -1) {
//       // Remove newline character from read string
//       if (line2[read2 - 1] == '\n') {
//         line2[read2 - 1] = '\0';
//       }

//       // Check if line2 matches pattern
//       if (regexec(&regex, line2, 0, NULL, 0) == 0) {
//         printf("%s\n", line2);
//       }
//     }

//     free(line2);
//   }
//   }

//   free(line);
//   regfree(&regex);
//   fclose(file1);
//   fclose(file2);
// }

// -o, --only-matching       показывать только часть строки, совпадающей с
// ШАБЛОНОМ   ---------------------------------------!!!!!!!!!!!!!!
void fun_o_print_match(char* namefile, char* pattern) {
  regex_t regex;
  char str_from_file[MAX_LINE_LEN];  // буфер для текущей строки
  int ret;
  ret = regcomp(&regex, pattern, REG_EXTENDED);

  if (ret != 0) {
    printf("Failed to compile regular expression\n");
  }

  FILE* file = fopen(namefile, "r");
  if (file == NULL) {
    printf("Ошибка при открытии файла\n");
  } else {
    while (fgets(str_from_file, MAX_LINE_LEN, file) != NULL) {
      int match_count = 0;
      regmatch_t matches[MAX_MATCHES];
      char* line_ptr = str_from_file;  // указатель на начало строки

      // ищем совпадения в строке, пока находим новые
      while (regexec(&regex, line_ptr, MAX_MATCHES, matches, 0) == 0) {
        char* match_start = line_ptr + matches[0].rm_so;
        char* match_end = line_ptr + matches[0].rm_eo;
        int match_len = match_end - match_start;

        // выделяем память для результата
        char* match_str = malloc((match_len + 1) * sizeof(char));
        if (match_str == NULL) {
          printf("Ошибка при выделении памяти\n");
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
    }
  }
  regfree(&regex);
  fclose(file);
}