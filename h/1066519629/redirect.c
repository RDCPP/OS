#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include "common.h"

////////////////////////////////////////////////////////////////////////
//  표준 입/출력을 이용한 리다이렉트 함수
////////////////////////////////////////////////////////////////////////
void redirect(int sourcefd, char *sourcefile, int destfd, char *destfile, BOOLEAN append, BOOLEAN backgrnd)
{
	int flags, fd;

	// 열려있는 소스 파일디스크립터가 없고 백그라운드 실행일 경우
	if (sourcefd == 0 && backgrnd) 
	{
		strcpy(sourcefile, "/dev/null");
		sourcefd = BADFD;
	}

	// 소스 파일 디스크립터가 있을 경우
	if (sourcefd != 0) 
	{
		// 표준입력을 닫는다.
		if (close(0) == ERROR)
		{
			syserr("close");
		}

		if (sourcefd > 0) 
		{
			// 표준입력을 재정의한다.
			if (dup(sourcefd) != 0)
			{
				fatal("dup");
			}
		}

		// 소스파일을 연다.
		else if (open(sourcefile, O_RDONLY, 0) == ERROR)
		{
			fprintf(stderr, "Cannot open %s\n", sourcefile);
			exit(0);
		}
	}
   
	// 출력 파일 디스크립터가 있다면
	if (destfd != 1) 
	{
		// 표준 출력을 닫는다.
		if (close(1) == ERROR)
		{
			syserr("close");
		}

		// 표준 출력을 재정의
		if (destfd > 1) 
		{
			if (dup(destfd) != 1)
			{
				fatal("dup");
			}
		}

		else
		{
			// 파일이 없을 경우에 생성하고, 쓰기도 가능하게 파일을 설정
			flags = O_WRONLY | O_CREAT;
			
			// 추가 모드가 아닐 경우 파일을 비우는 옵션도 추가
			if (!append)
			{
				flags |= O_TRUNC;
			}

			// 파일을 연다.
			if (open(destfile, flags, 0666) == ERROR) 
			{
				fprintf(stderr, "Cannot create %s\n", destfile);
				exit(0);
			}

			// 추가 모드라면 가장 끝을 찾는다.
			if (append)	
			{
				if (lseek(1, 0L, 2) == ERROR) syserr("lseek");
			}
		}
	}

	// 파일디스크립터를 닫는다.
	for (fd =3; fd < MAXFD; fd++)
	{
		close(fd);
	}

	return;
}
