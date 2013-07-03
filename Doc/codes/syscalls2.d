cat -n syscalls2.d
1 	#!/usr/sbin/dtrace -qs
2	
3	syscall:::entry
4	/pid == $1/
5	{
6		@[probefunc] = count();
7	}
8	syscall::rexit:entry
9	{
10		exit(0);
11	}