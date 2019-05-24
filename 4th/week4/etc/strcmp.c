#include <stdio.h>
#include <string.h>

int main() {
  char str1[20];
  char str2[20];
  int result;

  strcpy(str1, "hello");

  strcpy(str2, "hEllo");

  result = strcmp(str1, str2);

  if (result > 0) {
    printf("ASCII value of first unmatched character of str1 is greater than "
           "str2");
  } else if (result < 0) {
    printf(
        "ASCII value of first unmatched character of str1 is less than str2");
  } else if (result == 0) {
    // strcmp는 ASCII 값 비교를 하고 같으면 0을 반환한다.
    printf("Both the strings str1 and str2 are equal");
  }

  return 0;
}
