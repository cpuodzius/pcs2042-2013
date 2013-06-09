#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>

int main() {
	pid_t process;
	process = vfork(); // [process == 0 -> child, process > 0 -> parent]

	if(process < 0) {	//fork error
		perror("fork");
		exit(EXIT_FAILURE);
	}
	else if(process == 0) {
	/*
	 *	Child process calls execve (for filho.c)
	 */
		char *argv[] = { "filho", NULL};
		execve("filho", argv, NULL);
	}
	else {
		while(1)
			write(STDOUT_FILENO, "sou processo 1", strlen("sou processo 1"));
	}
	return 0;
}
