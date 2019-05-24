#include <stdio.h>
#include <unistd.h>

int main()
{
	int i;

	for (i = 0; i < 4; i++)
		fork();
	/**
	 * 생각보다 많은 프로세스가 생성된다. 왜 그럴까?
	 * 정확히 몇 개가 생성되는지 확인하는 방법은 다음과 같다. 
	 * 
	 * ./num_of_process & 
	 * pstree {pid}     	백그라운드 프로세스(&)로 실행하면 해당 프로세스의 pid를 반환해준다. 
	 * 			pstree {pid}를 통해 pid에 해당되는 부모 프로세스를 기점으로 자식 프로세들의 트리를 확인할 수 있다.
	 * pgrep num_of_process | wc -l
	 * ps aux | grep num_of_process
	 *
	 * 개수는 2^n 만큼 생성된다. 
	 * fork()를 4번 호출하였으므로 총 16개의 프로세스가 생성된다.
	 */

	sleep(120); 
	// 2분 동안 대기할 텐데 그 동안 pstree, pgrep, ps 등의 프로세스 유틸리티를 사용하도록 한다.
	
	return 0;
}
