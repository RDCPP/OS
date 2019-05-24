#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "common.h"

////////////////////////////////////////////////////////////////////////
//  명령어를 파싱한다.
////////////////////////////////////////////////////////////////////////
SYMBOL parse(int *waitpid, BOOLEAN makepipe, int *pipefdp)
{
	SYMBOL symbol, term;
	int argc, sourcefd, destfd;
	int pid, pipefd[2];
	char *argv[MAXARG+1], sourcefile[MAXFNAME];
	char destfile[MAXFNAME];
	char word[MAXWORD];
	BOOLEAN append;

	argc = 0;			
	sourcefd = 0;		
	destfd = 1;			

	
	while (TRUE) 
	{
		// 하나의 단어씩을 분석한다.
		switch (symbol = getsymbol(word))		
		{
			// 일반 문자일 경우
			case S_WORD :					
				if(argc == MAXARG) 
				{
					fprintf(stderr, "Too many args.\n");
					break;
				}

				// 새로운 인자 배열을 메모리 할당 한다.
				argv[argc] = (char *) malloc(strlen(word)+1);
				
				if(argv[argc] == NULL) 
				{
					fprintf(stderr, "Out of arg memory.\n");
					break;
				}

				// 명령어 복사
				strcpy(argv[argc], word);
				
				// arg 카운터 증가
				argc++;
				continue;

			// < 일 경우
			case S_LT   : 
			
				// 파이프가 열려있다면 오류
				if(makepipe) 
				{
					fprintf(stderr, "Extra <.\n");
					break;
				}

				// 소스파일의 심볼값을 검사한다.
				if(getsymbol(sourcefile) != S_WORD) 
				{
					fprintf(stderr, "Illegal <.\n");
					break;
				}

				sourcefd = BADFD;
				continue;

			// > 혹은 >> 일 경우
			case S_GT   :
			case S_GTGT :

				// 목적 파일이 정의되어있지 않을 경우 에러
				if(destfd != 1) 
				{
					fprintf(stderr, "Extra > or >>.\n");
					break;
				}

				// 목적어 파일의 심볼타임이 문자열이 아니면 에러
				if(getsymbol(destfile) != S_WORD) 
				{
					fprintf(stderr, "Illegal > or >>.\n");
					break;
				}

				// GTGT일 경우 추가 모드로
				destfd = BADFD;
				append = (symbol == S_GTGT);
				continue;

			// |, &, ;, 줄바꿈 문자일 경우 - 하나의 명령어 단위
			case S_BAR  :
			case S_AMP  :
			case S_SEMI :
			case S_NL   :
			
				argv[argc] = NULL;
				// 심볼이 파이프(|) 일 경우
				if(symbol == S_BAR) 
				{
					if(destfd != 1) 
					{
						fprintf(stderr, "> or >> conflicts with |.\n");
						break;
					}
					
					// 현재의 표준출력 디스크립터를 함께 넘겨 명령어를 분석한다.
					term = parse(waitpid, TRUE, &destfd);
				}
				
				// 종료 문자 세팅
				else
				{
					term = symbol;
				}

				// 파이프가 열려있을 경우 파이프를 연결한다.
				if (makepipe) 
				{
					if (pipe(pipefd) == ERROR)
					{
						syserr("pipe");
					}
					*pipefdp = pipefd[1];
					sourcefd = pipefd[0];
				}

				// 명령을 수행한다.
				pid = execute(argc, argv, sourcefd, sourcefile,
								destfd, destfile,append, term == S_AMP);

				// 파이프가 아닐 경우 기다릴 PID를 설정
				if (symbol != S_BAR)
				{
					*waitpid = pid;
				}

				// 인자값을 없을 경우
				if (argc == 0 && (symbol != S_NL || sourcefd > 1))
				{
					fprintf(stderr, "Missing command.\n");
				}

				// 인자로 입력된 값들의 메모리 해제
				while (--argc >= 0)
				{
					free(argv[argc]);
				}

				return term;

			// 명령이 잘못되었을 경우 종료
			case S_EOF : 
				exit(0);
		} 
	}    
}
