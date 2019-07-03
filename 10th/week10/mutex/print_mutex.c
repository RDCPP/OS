#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define N 3

#define KNRM "\x1B[0m"
#define KRED "\x1B[31m"
#define KGRN "\x1B[32m"
#define KBLU "\x1B[34m"

pthread_mutex_t mutex;

void *print_red(void *data) {
  while (1) {
		pthread_mutex_lock(&mutex);
    printf("%sI am a red sentence.\n", KRED);
		printf("I love red apples\n");
		printf("and red strawberries\n");
		printf("I'am so excited and angry\n");
    printf("And I am trying to bother you all!!!!!!!!!!\n%s", KNRM);
		pthread_mutex_unlock(&mutex);
		usleep(rand()%2);
	}
}

void *print_blue(void *data) {
  while (1) {
		pthread_mutex_lock(&mutex);
    printf("%sI am a blue sentence.\n", KBLU);
		printf("I am always sad.....\n");
		printf("That's why people say\n");
		printf("\"I'm feeling blue\"\n");
		printf("when they are sad....\n");
    printf("And please leave me alone....\n%s", KNRM);
		pthread_mutex_unlock(&mutex);
		usleep(rand()%2);
  }
}

void *print_green(void *data) {
  while (1) {
		pthread_mutex_lock(&mutex);
    printf("%sI am a green sentence.\n", KGRN);
		printf("I a piece of public or common grassy land,\n");
		printf("especially in the center of a town.\n");
    printf("Guys, please don't fight\n%s", KNRM);
		pthread_mutex_unlock(&mutex);
		usleep(rand()%2);
  }
}

int main() {
  pthread_t thread_id[N];
	srand(time(NULL));
	
	pthread_mutex_init(&mutex, NULL);

  pthread_create(&thread_id[0], NULL, print_red, NULL);
  pthread_create(&thread_id[1], NULL, print_blue, NULL);
  pthread_create(&thread_id[2], NULL, print_green, NULL);

  for (int i = 0; i < N; i++) {
    pthread_join(thread_id[i], NULL);
  }

  pthread_mutex_destroy(&mutex);
}
