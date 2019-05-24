#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
  /* 
   * 랜덤한 숫자를 돌리다가 특별히 좋아하는 3의 배수가 
   * 나오면 더 이상 코드를 수행하지 않고 건너뛰고 
   * 무한루프를 빠져나오도록 하고 싶다.
   */
  int r;
  while (1) { /* 무한루프 */
    srand(time(NULL));
    r = rand();
    if (r % 3 == 0) {
      goto got_my_number;
    }

    /* 이 사이에는 건너뛰고 싶은 여러 코드들이 있다고 가정 */
  }
got_my_number:
  printf("My Favorite number: %d\n", r);
  return 0;
}
