#include <stdio.h>
#include <string.h>

int main(void) {
  char str[] = "This is a sample string, just testing.";
  char *p;
  // strtok을 할 때마다 커서처럼 사용
  // 상위 str 문자열을 탐색하며 
  // 부분적인 문자열을 출력하는데 사용

  printf("str[]=\"%s\"\n", str);

  p = strtok(str, " ");

  while (p != NULL) {
    printf("%s\n", p);
    /* 
     * 출력을 받아와서 따로 복사를 해둬야 함
     * p는 일시적으로만 값을 가리키기 때문
     *
     * (1) 공간확보: 배열 혹은 메모리할당
     * (2) 일시적으로 p가 가리키고 있는 문자열을 확보한 공간에 복사: 
     *
     * 		strcpy() 사용
     *
     */

    p = strtok(NULL, " ,");
  }

  printf("str[]=\"%s\"\n", str);
  // strtok을 사용하면 원본 문자열을 잘라버리기 때문에 주의할 것!

  return 0;
}
