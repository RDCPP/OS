#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

#define MAX_LEN 100 /* The maximum length command */

int main(void) {
  char *args[MAX_LEN / 2 + 1]; /* command line arguments */
  int should_run = 1;          /* flag to determine when to exit program */
  int background = 0;

  char *input;
  int status;

  while (should_run) {
    printf("my_shell> ");
    fflush(stdout);

    input = /* 입력 */;
    fgets(/* 입력 */);

    int i = 0;
    args[i] = /* 입력 */;
    while (/* 입력 */) {
      i++;
      args[i] = /* 입력 */;
    }

    if (/* 입력 */ == NULL)
      goto no_input;

    if (strcmp(/* 입력 */, "exit") == 0) {
      break;
    }

    if (strcmp(/* 입력 */, "&") == 0) {
      args[i - 1] = /* 입력 */;
      background = 1;
    }

    pid_t pid = fork();
    if (pid < 0) {
      perror("Fork error");
      exit(0);
    }

    if (pid == 0) {
		execvp(args[0], args);
    }

    if (pid > 0) {
      if (!background) {
		/* 입력 */

      }
    }
  no_input:;
  }

  return 0;
}
