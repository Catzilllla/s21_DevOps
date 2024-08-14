#include "parser.h"

int main(int argc, char* argv[]) {
  FILE* readparser_file;
  struct parsing_struct option_struct = {0};
  // char search_string[MAX_LINE_LEN] = {0};
  char* patterns[100] = {0};
  char* files[100] = {0};
  int arr_w_pat_size = 0;
  int arr_w_fil_size = 0;

  parser_arguments(argc, argv, &option_struct, patterns, &arr_w_pat_size, files,
                   &arr_w_fil_size);

  int count_file = argc - optind;  // передавать в каждый  if else

  //  нету флага -е - один паттерн
  if (!option_struct.opt_e && !option_struct.opt_f) {
    patterns[0] = (char*)malloc((strlen(argv[optind]) + 1) * sizeof(char));
    strcpy(patterns[0], argv[optind]);
    arr_w_pat_size++;
    optind++;
  }

  // -e несколько паттернов
  while (argc > optind) {
    // -s success
    if (((readparser_file = fopen(argv[optind], "rb")) == NULL) &&
        !option_struct.opt_s) {
      fprintf(stderr, "%s: %s: No such file or directory\n", argv[0],
              argv[optind]);
    }
    // -e
    else if ((readparser_file != NULL) && option_struct.opt_e) {
      fun_e_search(argv[optind], *patterns, readparser_file, count_file);
    }
    // -i
    else if ((readparser_file != NULL) && option_struct.opt_i) {
      count_file = count_file - 1;
      fun_i_ignore_reg(argv[optind], *patterns, readparser_file, count_file);
    }
    // -v
    else if ((readparser_file != NULL) && option_struct.opt_v) {
      count_file = count_file - 1;
      fun_v_invert_pattern(argv[optind], *patterns, readparser_file,
                           count_file);
    }
    // -c
    else if ((readparser_file != NULL) && option_struct.opt_c) {
      fun_c_count_str_accord(argv[optind], *patterns);
    }
    // -l
    else if ((readparser_file != NULL) && option_struct.opt_l) {
      fun_l_acoord_files(argv[optind], *patterns);
    }
    // -n
    else if ((readparser_file != NULL) && option_struct.opt_n) {
      fun_n_num_str_search(argv[optind], *patterns);
    }
    // -h
    else if ((readparser_file != NULL) && option_struct.opt_h) {
      fun_h_noname_file(argv[optind], *patterns);
    }
    // -o
    else if ((readparser_file != NULL) && option_struct.opt_o) {
      fun_o_print_match(argv[optind], *patterns);
    }
    // -f
    else if ((readparser_file != NULL) && option_struct.opt_f) {
      fun_f_search(files, argv[optind]);
    }
    // grep default
    else if ((readparser_file != NULL)) {
      fun_grep_search(argv[optind], *patterns, readparser_file, count_file);
    }

    optind++;
  }

  for (int i = 0; i < 100; i++) {
    if (files[i] != NULL) {
      free(files[i]);
      files[i] = NULL;
    }
  }

  for (int i = 0; i < 100; i++) {
    if (patterns[i] != NULL) {
      free(patterns[i]);
      patterns[i] = NULL;
    }
  }
}