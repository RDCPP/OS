#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define INIT 0
#define EATING 1
#define THINKING 2

#define KNRM "\x1B[0m"
#define KRED "\x1B[31m"
#define KGRN "\x1B[32m"
#define KYEL "\x1B[33m"
#define KBLU "\x1B[34m"

#define N 5

int name[N];
int state[N];

sem_t forks[N];
pthread_mutex_t print_mutex;

void print_table_index() {
  for (int i = 0; i < N; i++)
    printf("=========================");
  printf("\n");
  for (int i = 0; i < N; i++)
    printf("|\tPHIL[%d]\t\t|", i);
  printf("\n");
  for (int i = 0; i < N; i++)
    printf("=========================");
  printf("\n");
}

void print_fork(int name, int fork) {
  pthread_mutex_lock(&print_mutex);
  printf("PHIL[%d] has taken %d th fork.\n", name, fork);
  pthread_mutex_unlock(&print_mutex);
}

void update_state(int phil, int status) {
  pthread_mutex_lock(&print_mutex);
  state[phil] = status;
  for (int i = 0; i < N; i++) {
    if (state[i] == INIT)
      printf("|\tINIT\t\t|");
    else if (state[i] == THINKING)
      printf("|%s\tTHINKING\t%s|", KBLU, KNRM);
    else if (state[i] == EATING)
      printf("|%s\tEATING\t\t%s|", KGRN, KNRM);
  }
  printf("\n");
  pthread_mutex_unlock(&print_mutex);
}

void *philosopher(void *_phil) {
  int phil = *((int *)_phil);

  do {
    sem_wait(&forks[(phil + 1) % N]);
    print_fork(phil, (phil + 1) % N);

    // DEADLOCK: Every philosopher holds
    // the right fork simultaneously
    sleep(2);

    sem_wait(&forks[phil]);
    print_fork(phil, phil);

    update_state(phil, EATING);

    usleep(rand() % 1000000);

    sem_post(&forks[(phil + 1) % N]);
    sem_post(&forks[phil]);

    update_state(phil, THINKING);
    usleep(rand() % 2000000);

  } while (1);
  pthread_exit(0);
}

int main() {
  pthread_t thread_id[N];

  srand(time(NULL));

  pthread_mutex_init(&print_mutex, NULL);

  for (int i = 0; i < N; i++) {
    sem_init(&forks[i], 0, 1);
    state[i] = 0;
  }

  print_table_index();

  for (int i = 0; i < N; i++) {
    name[i] = i;
    pthread_create(&thread_id[i], NULL, philosopher, &name[i]);
  }

  for (int i = 0; i < N; i++) {
    pthread_join(thread_id[i], NULL);
  }

  for (int i = 0; i < N; i++) {
    sem_destroy(&forks[i]);
  }

  pthread_mutex_destroy(&print_mutex);
}
