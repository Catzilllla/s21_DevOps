#include "parser.h"

void parser_arguments(int argc_pars, char* argv_pars[],
                      struct parsing_struct* my_parser, char* patterns[],
                      int* size, char* files[], int* file_size) {
  char symbol_arg;
  // char* opts = ;
  int check = 1;

  // optind - индекс 1го элемента, который не опция
  // optarg != null если есть ":" в opstring

  while (((symbol_arg = getopt_long(argc_pars, argv_pars, "e:ivclnhsf:o", NULL,
                                    0)) != -1) &&
         check) {
    if (my_parser->opt_error == 0) {
      switch (symbol_arg) {
        case 'e':
          my_parser->opt_e = 1;
          patterns[*size] = (char*)malloc(1 * sizeof(optarg));
          strcpy(patterns[*size], optarg);
          *size += 1;
          break;
        case 'i':
          my_parser->opt_i = 1;
          break;
        case 'v':
          my_parser->opt_v = 1;
          break;
        case 'c':
          my_parser->opt_c = 1;
          break;
        case 'l':
          my_parser->opt_l = 1;
          break;
        case 'n':
          my_parser->opt_n = 1;
          break;
        case 'h':
          my_parser->opt_h = 1;
          break;
        case 's':
          my_parser->opt_s = 1;
          break;
        case 'f':
          my_parser->opt_f = 1;
          files[*file_size] =
              (char*)malloc((strlen(optarg) + 1) * sizeof(char));
          strcpy(files[*file_size], optarg);
          *file_size += 1;
          break;
        case 'o':
          my_parser->opt_o = 1;
          break;
        default:
          check = 0;
          my_parser->opt_error = 1;
          printf("Usage: %s <pattern> [<file>]\n", argv_pars[0]);
          break;
      }

    } else if (!check)
      printf("ERROR MEMMORY WITH FLAG CHECK\n");
  }
}
