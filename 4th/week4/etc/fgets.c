#include <stdio.h>
#include <stdlib.h>

#define MAX_LEN 100 

int main(void)
{
	char *input = (char*)malloc(MAX_LEN*sizeof(char));
	// 고정된 공간을 활용하고 싶은 경우 다음과 같이 배열로 대체 가능:
	// char input[MAX_LEN];

	fgets(input, MAX_LEN, stdin); 
	// scanf는 제약이 많기 때문에 본 예제에서는 fgets를 사용하는 것이 유리
	// 표준 입력으로부터 읽을 때 stdin 사용

	printf("INPUT: %s\n", input); 
	// 출력해보면 한줄이 띄워질텐데 '\n'이라는 줄바꿈 문자를 입력받게 되서 그런 것임

	free(input); 
	// 모든 처리가 완료되면, malloc을 통해 할당한 메모리를 해제해줌
	
	return 0;
}

