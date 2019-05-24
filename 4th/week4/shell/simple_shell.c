// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <sys/wait.h>
// #include <unistd.h>

// #define MAX_LEN 100 /* The maximum length command */

// int main(void) {
//   char *args[MAX_LEN / 2 + 1]; /* command line arguments */
//   int should_run = 1;          /* flag to determine when to exit program */
//   int background = 0;

//   while (should_run) {
//     printf("my_shell> ");
//     fflush(stdout);

// 	char *input = (char*)malloc(MAX_LEN*sizeof(char));

// 	fgets(input, MAX_LEN, stdin);

// 	if(*input == '\0')
// 		goto last;

// 	char *p = strtok(input," ");

// 	while (p != NULL){
// 		printf("%s\n", p);
// 		printf("%d\n", strcmp(p,"exit\n"));

// 		p = strtok(NULL, " ,");
// 	}
//     /**
//      * 표준입출력으로부터 문자열을 입력 받은 후:
//      * (1) fork()를 통해 자식 프로세스를 생성
//      * (2) 자식 프로세스가 execvp()를 호출하도록 할 것
//      * (3) 만약 입력받은 문자에 &가 포함되어 있으면,
//      *     부모 프로세스는 wait() 호출하지 않음
//      */
// 	last :
// 		free(input);
//   }
//   return 0;
// }

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

    input = (char*)malloc(MAX_LEN*sizeof(char));
    memset(input,0,MAX_LEN / 2 + 1);
    fgets(input, MAX_LEN, stdin);

    input[strlen(input) - 1] = '\0';

    if (*input == '\0'){
      goto no_input;
    }

    int i = 0;
    
    args[i] = strtok(input," ");
    while (args[i] != NULL) {
      i++;
      args[i] = strtok(NULL," ");
    }

    if (strcmp(args[0], "exit") == 0) {
      break;
    }

    if (strcmp(args[i-1], "&") == 0) {
      args[i - 1] = NULL;
      background = 1;
    }

    pid_t pid = fork();

    if (pid < 0) {
      perror("Fork error");
      exit(0);
    }

    if (pid == 0) {
      printf("\n");
		  execvp(args[0], args);
    }

    if (pid > 0) {
      if (!background) {
        waitpid(pid,&status,0);
      }
      else {
		    background = 0;
	    }
    }
  no_input:

    free(input);
  }

  return 0;
}
