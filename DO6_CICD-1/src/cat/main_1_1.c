// https://www.opennet.ru/man.shtml?topic=getopt&category=3&russian=0
// https://ru.manpages.org/getopt/3

#include <getopt.h>
#include <string.h>
#include <unistd.h>

#include "parser.h"
#define NMAX 500

int main(int argc, char* argv[]) {
  // int count = 1, index_name = 0, index_buff = 0;
  // char cat_options, symb;

  // int index_str;
  // char str_buffer[500];
  // char* estr;
  // FILE* readparser_file;
  struct parsing_struct option_struct = {0};

  // char cat_options;
  // char file_name[300];

  // char* argси список append_buffer;
  int index_arg = 0;
  int index_massiv_argv = 0;
  int colums = 0;
  int dash_flag = 0;
  // int filename_index = 0;
  char* opts = "b:e:n:s:t:v:";
  char op;
  char all_argv_string[NMAX];
  char* file_name = {0};

  // flag for cat without arguments
  // int without_flag_cat = 0;

  while (index_arg < argc) {
    colums = 0;

    // write all input from the terminal to the array
    while (argv[index_arg][colums]) {
      // how many dash in input
      if (argv[index_arg][colums] == '-') dash_flag++;
      all_argv_string[index_massiv_argv] = argv[index_arg][colums];
      colums++;
      index_massiv_argv++;
    }
    all_argv_string[index_arg] = (char)32;
    index_arg++;
  }
  printf("--- %s --- \n", all_argv_string);

  colums = 0;
  index_arg = 0;
  index_massiv_argv = 0;

  if (strstr(all_argv_string, "-") && (dash_flag == 1)) {
    while ((op = getopt(argc, argv, opts)) != -1) {
      parser_arguments(op, &option_struct);
      printf("cat_options = %c \n", op);
      printf("get_opt OPTARG = %s \n", optarg);
      printf("get_opt OPTIND = %d \n", optind);
      file_name = optarg;
      printf("file_name = %s \n", file_name);
      printf("\n===========END \"-\" =========\n\n\n");
    }
  } else {
    if (strstr(all_argv_string, "--") && (dash_flag == 2)) {
      while ((op = getopt(argc, argv, opts)) != -1) {
        parser_arguments(op, &option_struct);
        printf("cat_options = %c \n", op);
      }
    }
  }
  index_arg++;

  // printf("file_name = %s \n", file_name);
  printf("opt_b_struct = %d\n", option_struct.opt_b);
  printf("opt_e_struct = %d\n", option_struct.opt_e);
  printf("opt_n_struct = %d\n", option_struct.opt_n);
  printf("opt_s_struct = %d\n", option_struct.opt_s);
  printf("opt_t_struct = %d\n", option_struct.opt_t);
  printf("opt_v_struct = %d\n", option_struct.opt_v);
  // printf("argc = %d without_flag_cat = %d", argc, without_flag_cat);
}
//     //struct of the arguments(options)
//     if (argv[count][0] == '-') {
//         while (argv[count][index_arg]) {
//             cat_options = argv[count][index_arg];
//             parser_arguments(cat_options, &option_struct);
//             index_arg++;
//         }

//         // name of the arguments(operands)
//         index_name = 0;
//         while(argv[2][index_name]) {
//             file_name[index_name] = argv[2][index_name];
//             index_name++;
//         }
//         file_name[index_name] = argv[2][index_name];
//     }
//     else {
//         // name of the arguments(operands)
//         index_name = 0;
//         while(argv[1][index_name]) {
//             file_name[index_name] = argv[1][index_name];
//             index_name++;
//         }
//         file_name[index_name] = argv[1][index_name];
//     }
//     // printf("file_name = _%s_\n", file_name);
//     // printf("opt_b_struct = %d\n", option_struct.opt_b);
//     // printf("argc = %d", argc);

//     if (argc > 2) {
//         if (argv[count][0] == '-') {

// //| 1 | -b (GNU: --number-nonblank) | нумерует только непустые строки |
//             if ((option_struct.opt_b == 1) && ((readparser_file =
//             fopen(file_name, "rb")) != NULL)) {
//                 index_str = 1;
//                 while((estr = fgets(str_buffer, sizeof(str_buffer),
//                 readparser_file))) {
//                     if (estr[0] != '\n') {
//                         printf("%6d	%s", index_str, str_buffer);
//                         index_str++;
//                     }
//                     else {
//                         printf("%s", str_buffer);
//                     }
//                 }
//             }
//             else {
//                 // | 2 | -e предполагает и -v (GNU only: -E то же самое, но
//                 без применения -v) | также отображает символы конца строки
//                 как $  | if ((option_struct.opt_e == 1) && ((readparser_file
//                 = fopen(file_name, "rb")) != NULL)) {
//                     while((symb = fgetc(readparser_file)) != EOF) {
//                         if (symb == '\n') {
//                             printf("$");
//                             printf("%c", symb);
//                         }
//                         else {
//                             printf("%c", symb);
//                         }
//                     }
//                 }
//                 else {
//                     //| 3 | -n (GNU: --number) | нумерует все выходные строки
//                     | if ((option_struct.opt_n == 1) && ((readparser_file =
//                     fopen(file_name, "rb")) != NULL)) {
//                         index_str = 1;
//                         while((estr = fgets(str_buffer, sizeof(str_buffer),
//                         readparser_file))) {
//                             printf("%6d	%s", index_str, estr);
//                             index_str++;
//                         }
//                     }
//                     else {
//                         //| 4 | -s (GNU: --squeeze-blank) | сжимает несколько
//                         смежных пустых строк | index_str = 0; int flag = 0;
//                         if ((option_struct.opt_s == 1) && ((readparser_file =
//                         fopen(file_name, "rb")) != NULL)) {
//                             while((estr = fgets(str_buffer,
//                             sizeof(str_buffer), readparser_file))) {
//                                 if (*estr != '\n') {
//                                     printf("%s", estr);
//                                     flag = 0;
//                                 }

//                                 if ((*estr == '\n') && (flag == 0)) {
//                                     flag = 1;
//                                     printf("%s", estr);
//                                 }

//                             }
//                         }
//                         else {
//                             //| 5 | -t предполагает и -v (GNU: -T то же
//                             самое, но без применения -v) | также отображает
//                             табы как ^I | if ((option_struct.opt_t == 1) &&
//                             ((readparser_file = fopen(file_name, "rb")) !=
//                             NULL)) {
//                                 while((estr = fgets(str_buffer,
//                                 sizeof(str_buffer), readparser_file))) {

//                                 }
//                             }
//                             else {
//                                 fprintf(stderr, "ERROR: Can't read a file");
//                             }
//                         }
//                     }

//                 }
//             }
//         }
//     }
//     else {
//         if ((readparser_file = fopen(file_name, "rb")) != NULL) {
//                 index_buff = 0;
//                 while((symb = fgetc(readparser_file)) != EOF) {
//                     printf("%c", symb);
//                     index_buff++;
//                 }
//         }
//         else {
//                 fprintf(stderr, "ERROR: Can't read a file");
//         }
//     }
//     fclose(readparser_file);
//     return 0;
// }

// void cat_output_to_strim(char* cat_buffer) {
//     printf("%s", cat_buffer);
// }

// void b_output_to_strim(char* b_buffer) {

//     printf("%s", b_buffer);
// }

// void e_output_to_strim(char* e_buffer) {
//     printf("%s", e_buffer);
// }
