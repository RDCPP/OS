#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
	pid_t pid;

	/* 새로운 자식을 fork 한다. */
	pid = fork();

	if (pid < 0) { /* 에러가 발생한 경우 */
		fprintf(stderr, "Fork failed");
		return 1;

	}else if(pid == 0) { /* 자식 프로세스 */
		printf("================================\n");
		printf("CHILD: ls command\n");
		execlp("/bin/ls","ls",NULL);

		printf("/'execlp/' call was unsuccessful\n"); /* 해당 줄의 코드는 출력되지 않는다. 왜? */

	}else { /* 부모 프로세스 */
		/* parent will wait for the child to complete */
		wait(NULL);
		printf("--------------------------------\n");
		printf("PARENT: Child Complete\n");
		printf("--------------------------------\n");
	}

	return 0;
}
