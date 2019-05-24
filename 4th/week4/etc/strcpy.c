#include <stdio.h>
#include <string.h>

int main () {
   char src[50];
   char dest[100];
  
   memset(dest, '\0', sizeof(dest)); 
   // Garbage 값이 들어있을 수 있으니, null로 초기화를 해줌
   
   strcpy(src, "Operating Systems are Amazing, aren't they?");

   printf("Before strcpy:\nSRC: %s\nDEST: %s\n\n", src, dest);

   strcpy(dest, src); // 방향주의! 왼쪽으로 <- 오른쪽에서 복사

   printf("After strcpy:\nSRC: %s\nDEST: %s\n", src, dest);
   
   return(0);
}
