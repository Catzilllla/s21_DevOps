#include "parser.h"

int main(int argc, char* argv[]) {
  int i, k;
  printf("Count arguments include name .o file = %d \n\n", argc);

  for (i = 0; i < argc; i++) {
    k = 0;
    printf("Argument #%d: ", i);
    while (argv[i][k]) {
      putchar(argv[i][k]);
      k++;
    }
    printf("\n");
  }

  struct parsing_struct option_struct = {0};
  parser_arguments(argv[1][1], &option_struct);
  printf("\n %d", option_struct.opt_b);
  printf("\n %d", option_struct.opt_e);

  cat_output_to_strim("\ndshfdshfldsh");
  return 0;
}

void cat_output_to_strim(char* catbuffer) { printf("%s", catbuffer); }