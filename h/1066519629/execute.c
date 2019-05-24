#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "common.h"

////////////////////////////////////////////////////////////////////////
//  명령어를 실행하는 함수
////////////////////////////////////////////////////////////////////////
int execute(int ac, char *av[], int sourcefd, char *sourcefile, int destfd, char *destfile,
	BOOLEAN append, BOOLEAN backgrnd)
{
	int pid;

	// 인자가 없거나 사용자 정의 명령을 수행하여 실패하였을 경우
	if (ac == 0 || shellcmd(ac, av, sourcefd, destfd))
	{
		return 0;
	}

	// 프로세스를 fork한다.
	pid = fork();

	switch (pid)
	{
		// 에러가 났을 경우
		case ERROR : 
			fprintf(stderr, "Cannot create new process.\n");
			return 0;

		// 자식일때, 프로그램을 실행하는 실체
		case 0 :     
			redirect(sourcefd, sourcefile, destfd, destfile, append, backgrnd);
			execvp(av[0], av);
			fprintf(stderr, "Cannot execute %s\n", av[0]);
			exit(0);

		// 부모일 때
		default :
			// 읽기 파일디스크립션을 닫는다.
			if(sourcefd > 0 && close(sourcefd) == ERROR)
			{
				syserr("close sourcefd");
			}

			// 쓰기 파일디스크립션을 닫는다.
			if(destfd > 1 && close(destfd) == ERROR)
			{
				syserr("close destfd");
			}

			// 백그라운드 명령일 경우 pic 출력
			if(backgrnd)
			{
				printf("%d\n", pid);
			}
			
			return pid;
	}
}
