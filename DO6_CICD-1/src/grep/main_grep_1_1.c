#include "parser.h"

int main(int argc, char* argv[]) {
  struct parsing_struct option_struct = {0};
  // char search_string[MAX_LINE_LEN] = {0};
  char* patterns[100] = {0};
  char* files[100] = {0};
  int arr_w_pat_size = 0;
  int arr_w_fil_size = 0;

  parser_arguments(argc, argv, &option_struct, patterns, &arr_w_pat_size, files,
                   &arr_w_fil_size);

  printf("%s", patterns[0]);  // root
  printf("%s", patterns[1]);  // test_passwd

  // 1 - прописать все функции поиска по флагам
  // 2 - настроить применение флагов через условия

  // if (optind != argc) {
  //     fun_grep_search(*files[0], *patterns[0]);
  // }
  if (argc > 3) {
  }
  // else if (option_struct.opt_e) {
  //     fun_e_search(*files, *patterns);
  // }
  else if (option_struct.opt_i) {
    fun_i_ignore_reg(argv[3], argv[2]);
  } else if (option_struct.opt_v) {
    fun_v_invert_pattern(argv[3], argv[2]);
  } else if (option_struct.opt_c) {
    fun_c_count_str_accord(argv[3], argv[2]);
  } else if (option_struct.opt_l) {
    fun_l_acoord_files(argv[3], argv[2]);
  } else if (option_struct.opt_n) {
    fun_n_num_str_search(argv[3], argv[2]);
  } else {
    printf("Usage: %s <pattern> [<file>]\n", argv[0]);
  }
}
