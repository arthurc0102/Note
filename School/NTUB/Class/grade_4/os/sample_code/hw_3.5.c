#include <stdio.h>
#include <stdlib.h>

int main() {
  printf("a\n");
  fork();
  printf("b\n");
  fork();
  printf("c\n");
  fork();
  printf("d\n");
  fork();
}
