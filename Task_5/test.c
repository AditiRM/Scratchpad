#include <stdio.h>

int foo(int a) {
  printf("In foo\n");
  return a + 100;
}

int main() {
  printf("In main\n");
  printf("%d", foo(100));
  return 0;
}