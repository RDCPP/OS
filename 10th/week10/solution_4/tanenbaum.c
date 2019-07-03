#include <math.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

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

#define N 5

int name[N];
int state[N];

pthread_mutex_t print_mutex;

/* TODO 1: Declare forks */
sem_t forks[N];
/* TODO 2: Declare waiter (mutex) */
pthread_mutex_t mutex;

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
    /* TODO 3: Drop the forks */
    sem_post(&forks[phil]);
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
  sem_wait(&forks[phil]);
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
  pthread_mutex_init(&mutex,NULL);

  for (i = 0; i < N; i++) {
    /* TODO 10: Initialize each forks with 0 */
    sem_init(&forks[i],0,1);
    state[i] = INIT;
  }

  print_table_index();

  for (i = 0; i < N; i++) {
    name[i] = i;
    pthread_create(&thread_id[i], NULL, philosopher, &name[i]);
  }

  for (i = 0; i < N; i++) {
    pthread_join(thread_id[i], NULL);
  }

  for (i = 0; i < N; i++) {
    /* TODO 11: Destroy each forks */
    sem_destroy(&forks[i]);
  }

  pthread_mutex_destroy(&print_mutex);
  /* TODO 12: Destroy the waiter */
  pthread_mutex_destroy(&mutex);
}
