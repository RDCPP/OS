#include "util.c"
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ptrace.h>
#include <sys/reg.h>
#include <sys/types.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

pid_t tracee_pid;
struct user_regs_struct regs;
int status;
bool keep_looping = true;

int main(int argc, char **argv) {

  if (argc < 2) {
    printf("[USAGE]: ./tracer <pid-of-target-process>\n");
    return -1;
  }
  tracee_pid = atoi(argv[1]);
  ptrace(PTRACE_ATTACH, tracee_pid, NULL, NULL);
  waitpid(tracee_pid, &status, 0);

  while (keep_looping == true) {
    ptrace(PTRACE_SINGLESTEP, tracee_pid, NULL, NULL);
    waitpid(tracee_pid, &status, 0);
    ptrace(PTRACE_GETREGS, tracee_pid, NULL, &regs);
    printf("[ CURRENT REGISTER STATE ]\n");
    print_user_regs_struct(regs);
    keep_looping = peekpoke_interactively(tracee_pid, regs);
  }
  ptrace(PTRACE_DETACH, tracee_pid, NULL, NULL);
  return 0;
}


