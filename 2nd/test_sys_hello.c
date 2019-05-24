#include <linux/kernel.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <stdio.h>
int main( ){
	long int i = syscall(335); // hello의 시스템 콜 번호
	printf("SYSCALL::SYS_HELLO::RETVAL=%ld\n",i);
	return 0;
}
