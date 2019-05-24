#include <stdio.h>
#include "common.h"

typedef enum {NEUTRAL, GTGT, INQUOTE, INWORD} STATUS;

////////////////////////////////////////////////////////////////////////
//  문자열을 분석하며 심볼을 찾는 함수
////////////////////////////////////////////////////////////////////////
SYMBOL getsymbol(char *word)
{
	STATUS state;
	int c;
	char *w;
	
	state = NEUTRAL;
	w = word;

	while ((c = getchar()) != EOF) 
	{
		switch (state) 
		{
			case NEUTRAL :
				switch (c) 
				{
					case ';' :
						return S_SEMI;

					case '&' :
						return S_AMP;

					case '|' :
						return S_BAR;

					case '<' :
						return S_LT;

					case '\n':
						return S_NL;

					case ' ' :
					case '\t':
						continue;

					case '>' : 
						state = GTGT;
						continue;

					case '"' : 
						state = INQUOTE;
						continue;

					default  : 
						state = INWORD;
						*w++ = c;
						continue;
				}

			case GTGT:
				if (c == '>')
				{
					return S_GTGT;
				}
				ungetc(c, stdin);
				return S_GT;

			case INQUOTE:
				switch (c) 
				{
					case '\\' : 
						*w++ = getchar();
						continue;

					case '"'  : 
						*w = '\0';
						return S_WORD;

					default   : 
						*w++ = c;
						continue;
				}

			case INWORD:
				switch (c ) 
				{
					case ';' :
					case '&' :
					case '|' :
					case '<' :
					case '>' :
					case '\n':
					case ' ' :
					case '\t': 
						ungetc(c, stdin);
						*w = '\0';
						return S_WORD;

					default  : 
						*w++ = c;
						continue;
				}
		}
	}

   return S_EOF;
}
