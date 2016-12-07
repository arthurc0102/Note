#include <stdio.h>
#include <stdlib.h>

int main() {
  if (fork() == 0) {
    printf("a child 01\n");
  } else {
    if (fork() == 0) {
      printf("b child 02\n");
    } else {
      printf("c parenet\n");
    }
  }
}
