#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main() {
	while(1)
		write(STDOUT_FILENO, "\tfilho\n", strlen("\nfilho\n"));
	return 0;
}
