#include <stdio.h>

int i = 0;
int my_flag = 0xabcd;

int main(void) {

  /* First step: Compare my_flag with condition(0xabcd) */
  while (my_flag == 0xabcd) {
    i++;
  }

  /* Last step: Check if the value of the flag has changed */
  char hex_flag[20];
  sprintf(hex_flag, "%x", my_flag);
  printf("Tracee exits with flag: %s\n", hex_flag);

  return i;
}



