if [ -f bin/pai ]; then
	rm bin/pai
fi
if [ -f bin/filho ]; then
	rm bin/filho
fi
arm-none-linux-gnueabi-gcc -static -o pai src/pai.c
arm-none-linux-gnueabi-gcc -static -o filho src/filho.c
mv pai filho bin
