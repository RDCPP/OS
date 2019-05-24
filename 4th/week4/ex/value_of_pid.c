#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
	pid_t pid, pid1;

	pid  = fork();

	if (pid < 0) {
		printf("FORK ERROR\n");
		fprintf(stderr, "Fork failed");
		return 1;

	}else if (pid == 0) {
		printf("CHILD PROCESS\n");
		pid1 = getpid();
		printf("[A] child: pid = %d\n", pid); /* A */
		printf("[B] child: pid1 = %d\n", pid1); /* B */
	}else{
		printf("PARENT PROCESS\n");
		pid1 = getpid();
		printf("[C] child: pid = %d\n", pid); /* C */
		printf("[D] child: pid1 = %d\n", pid1); /* D */
		wait(NULL);
	}
	return 0;
}
