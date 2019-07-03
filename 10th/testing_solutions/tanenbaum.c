#include <math.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

/* FIXME 1: ceiling 함수를 사용하기 위한 라이브러리
 * gcc 컴파일 시 math 라이브러리 추가할 것(옵션: -lm)
 */
#include <math.h>

#define INIT 0
#define THINKING 1
#define HUNGRY 2
#define EATING 3

#define LEFT (phil + N - 1) % N
#define RIGHT (phil + 1) % N

#define KNRM "\x1B[0m"
#define KRED "\x1B[31m"
#define KGRN "\x1B[32m"
#define KYEL "\x1B[33m"
#define KBLU "\x1B[34m"

#define N 10

int name[N];
int state[N];

/* FIXME 2: Testing을 위한 전역변수들 */
int eat_count[N]; // 주어진 단위 시간 동안 식사를 대접받은 횟수 카운터
int eat_count_unit[N]; // 총 대접받은 횟수 카운터

pthread_mutex_t print_mutex;

/* TODO 1: Declare forks */
sem_t F[N];
/* TODO 2: Declare waiter (mutex) */
pthread_mutex_t mutex;

/* FIXME 3: 시간 단위 식사 횟수와 총 식사 횟수를 출력하기 위한 함수 */
void print_eat_count() {
  printf("\n\n");
  for (int i = 0; i < N; i++)
    printf("=========================");
  printf("\n");
  printf("== Unit Eat Count ==\n");
  for (int i = 0; i < N; i++)
    printf("|PHIL[%d]|", eat_count_unit[i]);
  printf("\n");
  printf("== Total Eat Count ==\n");
  for (int i = 0; i < N; i++)
    printf("|PHIL[%d]|", eat_count[i]);
  printf("\n");
  for (int i = 0; i < N; i++)
    printf("=========================");
  printf("\n\n");
}

/* Print table index for the status */
void print_table_index() {
  for (int i = 0; i < N; i++)
    printf("========================");
  printf("\n");
  for (int i = 0; i < N; i++)
    printf("|\tPHIL[%d]\t\t|", i);
  printf("\n");
  for (int i = 0; i < N; i++)
    printf("========================");
  printf("\n");
}

/* FIXME 4: 측정하고자 하는 시간 단위를 계산하는 함수 */
int evaluate_time_unit() {
  int f_i = N / 2; // 동시에 사용할 수 있는 포크 한쌍의 수(N 만큼 포크가 제공됨)
  float n = N; // 철학자의 수(소수점 자리 계산이 가능하도록 타입 변환)
  float f = f_i; // 포크 한쌍의 수(소수점 자리 계산이 가능하도록 타입 변환)
  return ceil(n / f) + 2; // 시간 단위 계산하여 반환
}

/* FIXME 5: 솔루션을 실시간으로 검증하기 위한 스레드 함수 */
void *testing_solution(void *data) {
  struct timeval start_time, curr_time;
  int time_unit = evaluate_time_unit();
  while (1) {
    // eat_count_unit 초기화
    for (int i = 0; i < N; i++) {
      eat_count_unit[i] = 0;
    }

    // 시간 단위만큼 기다림
    gettimeofday(&start_time, NULL);
    while (curr_time.tv_sec - start_time.tv_sec < time_unit) {
      gettimeofday(&curr_time, NULL);
    }

    // 시간 단위 동안 철학자 모두가 식사를 했는지 검사하고 아니면 프로그램 종료
    for (int i = 0; i < N; i++) {
      if (eat_count_unit[i] == 0) {
        printf("%s\n\n**** Failed to Satisfy the Time Unit ****\n\n%s", KRED,
               KNRM);
        exit(0);
      }
    }
    print_eat_count();
  }
  pthread_exit(0);
}

/* Update status & print tatus of all philosophers */
void update_state(int phil, int status) {
  pthread_mutex_lock(&print_mutex);
  state[phil] = status;         // Updating the status
  for (int i = 0; i < N; i++) { // Print all philosopher states
    if (state[i] == INIT)
      printf("|\tINIT\t\t|");
    else if (state[i] == THINKING)
      printf("|%s\tTHINKING\t%s|", KBLU, KNRM);
    else if (state[i] == HUNGRY)
      printf("|%s\t*HUNGRY*\t%s|", KRED, KNRM);
    else if (state[i] == EATING)
      printf("|%s\tEATING\t\t%s|", KGRN, KNRM);
  }
  printf("\n");
  pthread_mutex_unlock(&print_mutex);
}

/* Test if the philosopher can eat */
void test(int phil) {
  if (state[phil] == HUNGRY && state[LEFT] != EATING &&
      state[RIGHT] != EATING) {

    update_state(phil, EATING);

    /* FIXME 6: 식사를 할 때마다 카운터 증가
     * update_state(phil, EATING); 호출 하단에 위치
     */
    eat_count[phil]++;
    eat_count_unit[phil]++;

    /* TODO 3: Drop the forks */
    sem_post(&F[phil]);
  }
}

void take_forks(int phil) {
  /* TODO 4: Wait for the waiter */
  pthread_mutex_lock(&mutex);
  update_state(phil, HUNGRY);
  test(phil);
  /* TODO 5: The waiter leaves */
  pthread_mutex_unlock(&mutex);
  /* TODO 6: Take the forks */
  sem_wait(&F[phil]);
}

void drop_forks(int phil) {
  /* TODO 7: Wait for the waiter */
  pthread_mutex_lock(&mutex);
  update_state(phil, THINKING);
  test(LEFT);
  test(RIGHT);
  /* TODO 8: The waiter leaves */
  pthread_mutex_unlock(&mutex);
}

void *philosopher(void *_name) {
  int phil = *((int *)_name);

  do {
    sleep(1); /* Thinking */
    take_forks(phil);
    sleep(1); /* Eating */
    drop_forks(phil);
  } while (1);

  pthread_exit(0);
}

int main() {
  int i;
  pthread_t thread_id[N];

  pthread_mutex_init(&print_mutex, NULL);

  /* TODO 9: Initialize the waiter */
  pthread_mutex_init(&mutex, NULL);

  for (i = 0; i < N; i++) {
    /* TODO 10: Initialize each forks with 0 */
    sem_init(&F[i], 0, 0);
    state[i] = INIT;
  }

  print_table_index();

  for (i = 0; i < N; i++) {
    name[i] = i;
    pthread_create(&thread_id[i], NULL, philosopher, &name[i]);
  }

  /* FIXME 7: 솔루션을 검증하는 스레드 생성 */
  pthread_t testing_thread;
  pthread_create(&testing_thread, NULL, testing_solution, NULL);

  for (i = 0; i < N; i++) {
    pthread_join(thread_id[i], NULL);
  }

  /* FIXME 8: 검증 스레드의 종료를 기다림 */
  pthread_join(testing_thread, NULL);

  for (i = 0; i < N; i++) {
    /* TODO 11: Destroy each forks */
    sem_destroy(&F[i]);
  }

  pthread_mutex_destroy(&print_mutex);
  /* TODO 12: Destroy the Waiter */
  pthread_mutex_destroy(&mutex);
}
