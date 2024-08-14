// https://www.opennet.ru/man.shtml?topic=getopt&category=3&russian=0
// https://ru.manpages.org/getopt/3

#include "parser.h"

int main(int argc, char* argv[]) {
  int if_1_flag = 0;
  struct parsing_struct option_struct = {0};

  // прописать при выходе с ошибкой
  // прописать условие на все флаги 2 - Fail -b -e -n -s -t -v
  // test_files/test_1_cat.txt 7 - Fail -n -b test_files/test_1_cat.txt 8 - Fail
  // -s -n -e test_files/test_4_cat.txt

  // printf("\n argc = %d\n", argc);
  // printf("\n optarg = %s\n", optarg);

  parser_arguments(argc, argv, &option_struct);

  if ((argc < 3)) {
    fun_default_cat(argv[1], if_1_flag);
  } else {
    // -b
    if (option_struct.opt_b) {
      fun_number_non_blank(argv[optind], if_1_flag);
    } else {
      // -e
      if (option_struct.opt_e) {
        fun_eof_character_without_v(argv[optind], if_1_flag);
      } else {
        // -E
        if (option_struct.opt_largee) {
          fun_eof_character(argv[optind], if_1_flag);
        } else {
          // -n
          if (option_struct.opt_n) {
            fun_number(argv[optind], if_1_flag);
          } else {
            // -s
            if (option_struct.opt_s) {
              fun_squeeze_blank(argv[optind], if_1_flag);
            } else {
              // -t
              if (option_struct.opt_t) {
                fun_search_tabs(argv[optind], if_1_flag);
              } else {
                // -v
                if (option_struct.opt_v && !option_struct.opt_larget) {
                  fun_v(argv[optind], if_1_flag);
                } else {
                  // -T
                  if (option_struct.opt_larget) {
                    fun_search_tabs_without_v(argv[optind], if_1_flag);
                  } else {
                    // -benvst
                    if (option_struct.opt_b && option_struct.opt_e &&
                        option_struct.opt_n && option_struct.opt_n &&
                        option_struct.opt_s && option_struct.opt_t &&
                        option_struct.opt_v) {
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void func_output_massive(char* massive_fule) {
  int i = 0;
  while (massive_fule) {
    printf("%c", massive_fule[i]);
    i++;
  }
}