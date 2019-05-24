#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/reg.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

#define syscode_case(x)                                                        \
  case x:                                                                      \
    return #x

const char *get_syscode(long);

struct user_regs_struct regs;

int main() {
  pid_t child = fork();
  long orig_rax;
  if (child == 0) {
    ptrace(PTRACE_TRACEME,0,0,0);
    execl("/bin/ls", "ls", NULL);
  } else if (child < 0) {
    printf("Fork failed.\n");
  } else {
    int status;
    while (waitpid(child, &status, 0) && !WIFEXITED(status)) {
      orig_rax = ptrace(PTRACE_PEEKUSER,child,8*ORIG_RAX,NULL);
      ptrace(PTRACE_GETREGS,child,0,&regs);
      fprintf(stderr, "[SYSCALL]:%-20s\t%5lld\n", get_syscode(regs.orig_rax),
              regs.orig_rax);
      ptrace(PTRACE_SYSCALL,child,0,0);
    }
  }
  return 0;
}

const char *get_syscode(long code) {
  switch (code) {
    syscode_case(SYS_read);
    syscode_case(SYS_write);
    syscode_case(SYS_close);
    syscode_case(SYS_fstat);
    syscode_case(SYS_mmap);
    syscode_case(SYS_mprotect);
    syscode_case(SYS_munmap);
    syscode_case(SYS_brk);
    syscode_case(SYS_rt_sigaction);
    syscode_case(SYS_rt_sigprocmask);
    syscode_case(SYS_rt_sigreturn);
    syscode_case(SYS_ioctl);
    syscode_case(SYS_getpid);
    syscode_case(SYS_pread64);
    syscode_case(SYS_access);
    syscode_case(SYS_pipe);
    syscode_case(SYS_execve);
    syscode_case(SYS_getdents);
    syscode_case(SYS_statfs);
    syscode_case(SYS_exit_group);
    syscode_case(SYS_openat);
    syscode_case(SYS_mkdirat);
    syscode_case(SYS_prlimit64);
    syscode_case(SYS_arch_prctl);
    syscode_case(SYS_set_tid_address);
    syscode_case(SYS_set_robust_list);
  default:
    return "Not registered in the function list.";
  }
}
