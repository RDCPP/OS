#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>

int value = 5;

int main(){
	pid_t pid;

	pid = fork();

	if (pid == 0) { /* 자식 프로세스 */
		value += 15;
		return 0;
	} else if (pid > 0) { /* 부모 프로세스 */
		wait(NULL);
		printf("PARENT: value = %d\n", value); /* LINE A */
		return 0;
	}
}
