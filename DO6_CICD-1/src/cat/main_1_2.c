// https://www.opennet.ru/man.shtml?topic=getopt&category=3&russian=0
// https://ru.manpages.org/getopt/3

#include <getopt.h>
#include <string.h>
#include <unistd.h>

#include "parser.h"
#define NMAX 500

int main(int argc, char* argv[]) {
  int if_1_flag = 0;
  // int argc_flag = 0;
  char symbol_arg;
  char* opts = "b:e:n:s:t:v:";
  int option_index = 0;

  struct parsing_struct option_struct = {0};

  // struct option {
  //     const char *name;
  //     int has_arg;
  //     int *flag;
  //     int val;
  // };

  static struct option long_options[] = {
      {"number-nonblank", required_argument, 0, 'b'},
      {"e", required_argument, 0, 0},
      {"E", required_argument, 0, 0},
      {"number", required_argument, 0, 'n'},
      {"squeeze-blank", required_argument, 0, 's'},
      {"t", required_argument, 0, 0},
      {"T", required_argument, 0, 0},
      {0, 0, 0, 0}};

  while ((symbol_arg = getopt_long(argc, argv, opts, long_options,
                                   &option_index)) != -1) {
    switch (symbol_arg) {
      case 'b':
        option_index = 0;

        /* printf("параметр %s", long_options[option_index].name);
           printf("\n OPTIND = %d \n", optind);

           if (optarg) {
               printf("\n \"-b\" optarg = %s\n", optarg);
           } */

        parser_arguments(symbol_arg, &option_struct);
        fun_number_non_blank(optarg, if_1_flag);
        break;

      case 'e':
        option_index = 1;
        parser_arguments(symbol_arg, &option_struct);
        fun_eof_character(optarg, if_1_flag);
        break;

      case 'E':
        option_index = 2;
        parser_arguments(symbol_arg, &option_struct);
        fun_eof_character_without_v(optarg, if_1_flag);
        break;

      case 'n':
        option_index = 3;
        parser_arguments(symbol_arg, &option_struct);
        fun_number(optarg, if_1_flag);
        break;

      case 's':
        option_index = 4;
        parser_arguments(symbol_arg, &option_struct);
        fun_squeeze_blank(optarg, if_1_flag);
        break;

      case 't':
        option_index = 5;
        parser_arguments(symbol_arg, &option_struct);
        fun_search_tabs(optarg, if_1_flag);
        break;

      case 'T':
        option_index = 6;
        parser_arguments(symbol_arg, &option_struct);
        fun_search_tabs_without_v(optarg, if_1_flag);
        break;

      case '?':
        break;

        // прописать при выходе с ошибкой
        // прописать условие на все флаги 2 - Fail -b -e -n -s -t -v
        // test_files/test_1_cat.txt 7 - Fail -n -b test_files/test_1_cat.txt 8
        // - Fail -s -n -e test_files/test_4_cat.txt
    }
  }
  if (optind < argc) {
    fun_default_cat(argv[optind++], if_1_flag);
  }
}
