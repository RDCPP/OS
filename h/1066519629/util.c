#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "common.h"

////////////////////////////////////////////////////////////////////////
//  치명적인 오류 처리
////////////////////////////////////////////////////////////////////////
void fatal(char *message)
{
	fprintf(stderr, "Error: %s\n", message);
	exit(1);
}

////////////////////////////////////////////////////////////////////////
//  일반 에러 처리
////////////////////////////////////////////////////////////////////////
void syserr(char *message)
{
	fprintf(stderr, "Error: %s (%d", message, errno);
	exit(1);
}

////////////////////////////////////////////////////////////////////////
//  부모가 자식의 실행이 끝나길 기다리는 함수
////////////////////////////////////////////////////////////////////////
void waitfor(int pid)
{
	int wpid, status;

	// wait를 이용하여 프로세스를 기다린다.
	while ((wpid = wait(&status)) != pid && wpid != ERROR);
}

////////////////////////////////////////////////////////////////////////
//  프롬프트를 출력한다.
////////////////////////////////////////////////////////////////////////
void print_prompt()
{
	char *ps;
	char *index;

	// PS2 환경 변수를 읽어 사용한다.
	if((ps = (char*)getenv("PS2")) != NULL)
	{
		// 환경 변수의 값이 끝날때까지 한바이트씩 이동하며 확인
		while(*ps != '\0')
		{
			// 역슬래쉬(\)가 있다면 다음의 문자를 확인한다.
			if(*ps == '\\')
			{
				ps++;

				// 사용자 정보를 출력
				if(*ps == 'u')
				{
					printf("%s", getenv("USER"));
				}
				
				// 호스트명을 출력
				else if(*ps == 'h')
				{
					printf("%s", getenv("HOSTNAME"));
				}
				
				// 현재 디렉토리를 출력한다.
				else if(*ps == 'w')
				{
					printf("%s", get_current_dir_name());
				}
			}
			
			// 아무것도 아닐 경우 문자를 출력
			else
			{
				printf("%c", *ps);
				ps++;
			}
		}
	}
	
	// PS2 환경 변수가 없다면 기본 프롬프트를 출력한다.
	else
	{
		printf(">> ");
	}
}

////////////////////////////////////////////////////////////////////////
//  사용자 정의 명령을 처리하는 함수
////////////////////////////////////////////////////////////////////////
BOOLEAN shellcmd(int ac, char *av[], int sourcefd, int destfd)
{
	char *path;

	// cd
	if(!strcmp(av[0], "cd"))
	{
		cmd_cd(ac, av);
	}
	// ls
	else if(!strcmp(av[0], "ls"))
	{
		cmd_ls(ac, av);
	}
	// cp
	else if(!strcmp(av[0], "cp"))
	{
		cmd_cp(ac, av);
	}
	// rm
	else if(!strcmp(av[0], "rm"))
	{
		cmd_rm(ac, av);
	}
	// mv
	else if(!strcmp(av[0], "mv"))
	{
		cmd_mv(ac, av);
	}
	// mkdir
	else if(!strcmp(av[0], "mkdir"))
	{
		cmd_mkdir(ac, av);
	}
	// rmdir
	else if(!strcmp(av[0], "rmdir"))
	{
		cmd_rmdir(ac, av);
	}
	// cat
	else if(!strcmp(av[0], "cat"))
	{
		cmd_cat(ac, av);
	}
	// exit
	else if(!strcmp(av[0], "exit"))
	{
		cmd_exit();
	}
	else
	{
		return FALSE;
	}

	if (sourcefd != 0 || destfd != 1)
	{
		fprintf(stderr, "Ilegal redirection or pipeline.\n");
	}

	return TRUE;
}
