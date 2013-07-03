dtrace -n '
#pragma D option strsize=10000
syscall::read:entry
/execname == "cheese"/
{
	self->buf = arg1;
	self->len = arg2;
}

syscall::read:return
/self->buf != NULL/
{
	this->text = (char *)copyin(self->buf, self->len);

	printf("%5d %8s %d\n", pid, execname, sizeof(stringof(this->text)));
	self->buf = NULL;
	self->len = 0;
}
'
