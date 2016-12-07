#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>

int main(){
  pid_t pid;
  printf("1\n");
  pid = fork();
  printf("2\n");
  if (pid != 0) {
    wait(NULL);
    printf("3\n");
    exit(0);
  } else {
    printf("4\n");
  }
  printf("5\n");
}
