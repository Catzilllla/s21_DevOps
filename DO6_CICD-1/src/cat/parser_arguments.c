#include "parser.h"

void parser_arguments(int argc_pars, char* argv_pars[],
                      struct parsing_struct* my_parser) {
  char symbol_arg;
  char* opts = "benstvTE";
  int option_index = 0;

  // struct option {
  //     const char *name;
  //     int has_arg;
  //     int *flag;
  //     int val;
  // };

  static struct option long_options[] = {
      {"number-nonblank", no_argument, 0, 'b'},
      {"e", no_argument, 0, 0},
      {"E", no_argument, 0, 0},
      {"number", no_argument, 0, 'n'},
      {"squeeze-blank", no_argument, 0, 's'},
      {"t", no_argument, 0, 0},
      {"v", no_argument, 0, 0},
      {"T", no_argument, 0, 0},
      {0, 0, 0, 0}};

  while ((symbol_arg = getopt_long(argc_pars, argv_pars, opts, long_options,
                                   &option_index)) != -1) {
    if (argc_pars > 2) {
      switch (symbol_arg) {
        case 'b':
          my_parser->opt_b = 1;
          break;
        case 'e':
          my_parser->opt_e = 1;
          break;
        case 'E':
          my_parser->opt_largee = 1;
          break;
        case 's':
          my_parser->opt_s = 1;
          break;
        case 'n':
          my_parser->opt_n = 1;
          break;
        case 't':
          my_parser->opt_t = 1;
          break;
        case 'v':
          my_parser->opt_v = 1;
          break;
        case 'T':
          my_parser->opt_larget = 1;
          break;
        case '?':
          my_parser->opt_error = 1;
          break;
      }
    } else {
    }
    // printf("\n |||||||||||||||||||||||||||||||||||\n");
    // printf("\n argc = %d\n", argc_pars);

    // printf("\n  = %s\n", my_parser->e_opt_arg);
    // printf("\n  = %s\n", my_parser->n_opt_arg);
    // printf("\n  = %s\n", my_parser->s_opt_arg);
    // printf("\n  = %s\n", my_parser->t_opt_arg);
  }
  // printf("\n  = %d\n", my_parser->opt_v);
  // printf("\n  = %d\n", my_parser->opt_larget);
}
