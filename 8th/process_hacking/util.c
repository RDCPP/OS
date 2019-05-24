#include <sys/ptrace.h>
#include <sys/reg.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <sys/user.h> 
#include <stdbool.h> 

void print_peek_data(pid_t tracee_pid, long long int byte_offset) {
  printf("byte_offset:%llx\n", byte_offset);
  long long int peek_output;
  peek_output = ptrace(PTRACE_PEEKDATA, tracee_pid, byte_offset, NULL);
  if (peek_output == -1 & errno != 0) {
    printf("errno: %s\n", strerror(errno));
  }
  printf ("PEEKDATA: %llx \n", peek_output);
}

void print_peek_data_interactively(pid_t tracee_pid) {
  long long int input;
  printf("peekdata hexaddr: ");
  scanf("%llx", &input);
  print_peek_data(tracee_pid, input);
}

void poke_data(pid_t tracee_pid, long long int byte_offset, long long int word) {
  long long int ptrace_output;
  printf ("  poke_data called pid:%d, offset:%lld, word:%llx\n", tracee_pid, byte_offset, word);
  printf ("  word:%llx\n", word);
  ptrace_output = ptrace(PTRACE_POKEDATA, tracee_pid, byte_offset, word);
    if (ptrace_output == -1 & errno != 0) {
    printf("errno: %s\n", strerror(errno));
  }
}

void poke_data_interactively(pid_t tracee_pid) {
  long long int byte_offset;
  long long int word;
  printf ("poke hexaddr: ");
  scanf ("%llx", &byte_offset);
  printf ("hexword:");
  scanf("%llx", &word);
  poke_data(tracee_pid, byte_offset, word);

}

void print_user_regs_struct(struct user_regs_struct regs) {
  printf ("r15:     %16llx %30s\n", regs.r15, "general purpose registers");
  printf ("r14:     %16llx\n", regs.r14);
  printf ("r13:     %16llx\n", regs.r13);
  printf ("r12:     %16llx\n", regs.r12);
  printf ("rbp:     %16llx\n", regs.rbp);
  printf ("rbx:     %16llx\n", regs.rbx);
  printf ("r11:     %16llx\n", regs.r11);
  printf ("r10:     %16llx\n", regs.r10);
  printf ("r9:      %16llx   %s\n", regs.r9, "6.");
  printf ("r8:      %16llx   %s\n", regs.r8, "5.");
  printf ("rax:     %16llx\n", regs.rax);
  printf ("rcx:     %16llx   %s\n", regs.rcx, "4.");
  printf ("rdx:     %16llx   %s\n", regs.rdx, "3.");
  printf ("rsi:     %16llx   %s\n", regs.rsi, "2.");
  printf ("rdi:     %16llx %30s\n", regs.rdi, "1. function/syscall argument");
  printf ("orig_rax:%16llx\n", regs.orig_rax);
  printf ("rip:     %16llx %30s\n", regs.rip, "instruction pointer");
  printf ("cs:      %16llx\n", regs.cs);
  printf ("eflags:  %16llx\n", regs.eflags);
  printf ("rsp:     %16llx %30s\n", regs.rsp, "  Stack Pointer (current location in stack)");
  printf ("ss:      %16llx\n", regs.ss);
  printf ("fs_base: %16llx\n", regs.fs_base);
  printf ("gs_base: %16llx\n", regs.gs_base);
  printf ("ds:      %16llx\n", regs.ds);
  printf ("es:      %16llx\n", regs.es);
  printf ("fs:      %16llx\n", regs.fs);
  printf ("gs:      %16llx\n", regs.gs);
}

bool peekpoke_interactively(pid_t tracee_pid ,struct user_regs_struct regs)  {
  printf("(q)uit, next (s)tep, (p)eek data, (P)oke data, print (r)egisters  \n");
  char input_char;
  while (input_char != 's' && input_char != 'q') {
    input_char = getchar();
    if(input_char != '\n') {
      switch (input_char) {
      case 'p' : print_peek_data_interactively(tracee_pid); break;
      case 'P' : poke_data_interactively(tracee_pid); break;
      case 'r' : print_user_regs_struct(regs); break;
      }
    }
  }

  if (input_char == 'q') { 
    return false;
  } else { 
    return true;
  };
}
