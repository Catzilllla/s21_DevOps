#include "parser.h"

// | 1 | -b (GNU: --number-nonblank) | нумерует только непустые строки |

void fun_number_non_blank(char* namefile, int if_1_flag) {
  FILE* file = fopen(namefile, "r");
  if (file == NULL && if_1_flag != 0) {
    fprintf(stderr, "Error: can't open file \"%s\"\n", namefile);
    return;
  }

  int index = 1;
  char str_from_file[NMAX];
  while (fgets(str_from_file, sizeof(str_from_file), file) != NULL) {
    if (str_from_file[0] != '\n') {
      printf("%6d\t%s", index++, str_from_file);
    } else {
      printf("%s", str_from_file);
    }
  }
  fclose(file);
}
// FILE* readparser_file;
// int index_str = 1;
// int i = 0;
// char next_str_file[NMAX] = {0};
// char symb;
// char end_str_symb = '\n';

// if (((readparser_file = fopen(namefile, "r")) != NULL) && (if_1_flag == 0)) {
//   while (!feof(readparser_file)) {
//     symb = fgetc(readparser_file);
//     next_str_file[i] = symb;
//     i++;

//     if ((symb == '\n') && (end_str_symb != '\n')) {
//       printf("%6d\t%s", index_str, next_str_file);
//       // memset(next_str_file, 0, 80);
//       i = 0;
//       index_str++;
//     } else if ((symb == '\n') && (end_str_symb == '\n')) {
//       printf("%s", next_str_file);
//       i = 0;
//       // memset(next_str_file, 0, 80);
//     }
//     end_str_symb = symb;
//   }
// }
// }

// | 2 | -e предполагает и -v (GNU only: -E то же самое, но без применения -v) |
// также отображает символы конца строки как $  | ДОДЕЛАТЬ C -v
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
void fun_eof_character(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  char symb;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    while ((symb = fgetc(readparser_file)) != EOF) {
      if (symb == '\n') {
        printf("$");
        printf("%c", symb);
      } else {
        printf("%c", symb);
      }
    }
  }
}

// -E БЕЗ -v
void fun_eof_character_without_v(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  char symb;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    while ((symb = fgetc(readparser_file)) != EOF) {
      if (symb == '\n') {
        printf("$");
        printf("%c", symb);
      } else {
        printf("%c", symb);
      }
    }
  }
  // if (symb < -96) {
  // 	printf("M-^%symb", symb + 192);
  // } else if (symb < 0) {
  // 	printf("M-%symb",  symb + 128);
  // } else if (symb == 10 || symb == 9) {
  // 	symb = symb;
  // } else if (symb < 32) {
  // 	printf("^%symb", symb + 64);
  // } else if (symb < 127) {
  // 	printf("%symb", symb);
  // } else {
  // 	printf("^?");
  // }
}

// | 3 | -n (GNU: --number) | нумерует все выходные строки |
void fun_number(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  int index_str = 1;
  char* estr;
  char str_buffer[NMAX];
  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    index_str = 1;
    while ((estr = fgets(str_buffer, sizeof(str_buffer), readparser_file))) {
      printf("%6d	%s", index_str, estr);
      index_str++;
    }
  }
}

// | 4 | -s (GNU: --squeeze-blank) | сжимает несколько смежных пустых строк |
void fun_squeeze_blank(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  char* estr;
  char str_buffer[NMAX];
  int flag = 0;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    while ((estr = fgets(str_buffer, sizeof(str_buffer), readparser_file))) {
      if (*estr != '\n') {
        printf("%s", estr);
        flag = 0;
      }
      if ((*estr == '\n') && (flag == 0)) {
        flag = 1;
        printf("%s", estr);
      }
    }
  }
}

// | 5 | -t предполагает и -v (GNU: -T то же самое, но без применения -v) |
// также отображает табы как ^I | ДОДЕЛАТЬ C -v
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
void fun_search_tabs(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  int symb;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    while ((symb = fgetc(readparser_file)) != EOF) {
      if ((symb != '\t') && (symb != '\n') && (symb < 32)) {
        printf("^%c", (64 + symb));
      } else {
        if (symb == 127)
          printf("^?");
        else {
          if ((160 > symb) && (symb > 127)) {
            printf("M-^%c", (64 + (symb - 128)));
          } else if (symb == '\t')
            printf("^I");
          else if (symb == '\n')
            printf("%c", symb);
          else
            printf("%c", symb);
        }
      }
    }
  }
}

// | v | -v | показывает нечитаемые символы|
/*
^ + @ + symbol(0-31) \n\t
symbol(31-126)
^? (127)
M-^ + @ + (symbol-128) (128-159)
symbol(160-255)
*/
// c 160 символа не выводит нормально
void fun_v(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  int symb;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    while ((symb = fgetc(readparser_file)) != EOF) {
      if ((symb != '\t') && (symb != '\n') && (symb < 32)) {
        printf("^%c", (64 + symb));
      } else {
        if (symb == 127)
          printf("^?");
        else {
          if ((160 > symb) && (symb > 127)) {
            printf("M-^%c", (64 + (symb - 128)));
          } else if ((symb == '\t') && (symb == '\n'))
            printf("%c", symb);
          else
            printf("%c", symb);
        }
      }
    }
  }
}

// -T БЕЗ -v
void fun_search_tabs_without_v(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  char symb;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    while ((symb = fgetc(readparser_file)) != EOF) {
      if (symb == (char)9) {
        printf("^I");
      } else {
        printf("%c", symb);
      }
    }
  }
}

// default cat output without options
void fun_default_cat(char* optarg, int if_1_flag) {
  FILE* readparser_file;
  int index_str = 1;
  char symb;

  if (((readparser_file = fopen(optarg, "rb")) != NULL) && (if_1_flag == 0)) {
    index_str = 0;
    while ((symb = fgetc(readparser_file)) != EOF) {
      printf("%c", symb);
      index_str++;
    }
  }
}