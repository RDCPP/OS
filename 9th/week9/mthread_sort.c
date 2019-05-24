#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>

#define DATA_SIZE	16

void merge_sort(int data[], int p, int r);
void merge(int data[], int p, int q, int r);

void *sort_thread(void *param);
void *merge_thread(void *param);

void *t_print(void *data);

struct range{
	char *t_name; 
	int index;
	int end;
	int *data;
};

int main(int argc, char **argv) 
{
	int data[DATA_SIZE] = 
		{5, 16, 4, 7, 1, 3, 2, 6, 8, 13, 11, 9, 10, 12, 15, 14};
	pthread_t tid[3];
	int thr_id;
	int status;
	char tm[] = "thread_m";

	t_print((void *)tm);

	/* 1.DIVIDE */
	struct range first_half, second_half, merge_range;
	int mid = DATA_SIZE/2;

	first_half.t_name = "thread_1";
	first_half.index = 0;
	first_half.end = mid;
	first_half.data = data;

	second_half.t_name = "thread_2";
	second_half.index = mid+1;
	second_half.end = DATA_SIZE-1;
	second_half.data = data;

	merge_range.t_name = "thread_3";
	merge_range.index = mid;
	merge_range.end = DATA_SIZE-1;
	merge_range.data = data;

	/* 2.SORT */
	/* TODO: 1st Thread / Sort first half of data */
	pthread_create(&tid[0],NULL,sort_thread,&first_half);
	/* TODO: 2nd Thread / Sort second half of data */
	pthread_create(&tid[1],NULL,sort_thread,&second_half);

	pthread_join(tid[0],NULL);
	pthread_join(tid[1],NULL);

  /* 3.MERGE */
	/* TODO: 3rd Thread / Merge the result of two halfs  */
	pthread_create(&tid[2],NULL,merge_thread,&merge_range);

	/* TODO: waits for the first thread 	*/
	/* TODO: waits for the second thread 	*/
	/* TODO: waits for the third thread 	*/
	pthread_join(tid[2],NULL);

	int i;
	for(i = 0; i < DATA_SIZE; i++)
		printf("%d ", data[i]);
	printf("\n");
	return 0;
}

void *sort_thread(void *data)
{
	struct range *rdata = (struct range*) data;
	t_print(rdata->t_name);
	merge_sort(rdata->data, rdata->index, rdata->end);
	pthread_exit(0);
}

void *merge_thread(void *data)
{	
	struct range *rdata = (struct range*) data;
	t_print(rdata->t_name);
	merge(rdata->data, 0, rdata->index, rdata->end);
	pthread_exit(0);
}

void merge_sort(int data[], int p, int r) 
{
  int q;
  if (p < r) {
    q = (p + r) / 2;
    merge_sort(data, p, q);
    merge_sort(data, q + 1, r);
    merge(data, p, q, r);
  }
}

void merge(int data[], int p, int q, int r) 
{
  int i = p, j = q + 1, k = p;
  int tmp[DATA_SIZE];

  while (i <= q && j <= r) {
    if (data[i] <= data[j])
      tmp[k++] = data[i++];
    else
      tmp[k++] = data[j++];
  }
  while (i <= q)
    tmp[k++] = data[i++];
  while (j <= r)
    tmp[k++] = data[j++];
  for (int a = p; a <= r; a++)
    data[a] = tmp[a];
}

void *t_print(void *data) {
  pid_t pid;  // process id
  pthread_t tid;

  pid = getpid();
  tid = pthread_self();

  char* thread_name = (char*)data;
  
  printf("[%s] pid: %u, tid: %x\n",
			thread_name, (unsigned int)pid, (unsigned int)tid);
  sleep(1);
}



