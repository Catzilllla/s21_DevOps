#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define NMAX 5000

struct parsing_struct {
  int opt_b;
  int opt_e;
  int opt_largee;
  int opt_n;
  int opt_s;
  int opt_t;
  int opt_v;
  int opt_larget;
  int opt_error;

  char* namefiler;
};

void parser_arguments(int argc_pars, char* argv_pars[],
                      struct parsing_struct* my_parser);

void fun_number_non_blank(char* optarg, int if_1_flag);
void fun_eof_character(char* optarg, int if_1_flag);
void fun_eof_character_without_v(char* optarg, int if_1_flag);
void fun_number(char* optarg, int if_1_flag);
void fun_squeeze_blank(char* optarg, int if_1_flag);
void fun_search_tabs(char* optarg, int if_1_flag);
void fun_v(char* optarg, int if_1_flag);
void fun_search_tabs_without_v(char* optarg, int if_1_flag);
void fun_default_cat(char* optarg, int if_1_flag);
void func_output_massive(char* massive_fule);