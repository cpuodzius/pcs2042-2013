#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main() {
	while(1)
		write(STDOUT_FILENO, "filho imprimindo", strlen("filho imprimindo"));
	return 0;
}
