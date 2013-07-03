syscall:::entry					// probe description
/pid == $1/						// predicate
{
	@[probefunc] = count();		// action
}