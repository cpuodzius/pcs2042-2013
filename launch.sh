clear
qemu-system-arm -M versatilepb -m 128M -kernel linux-2.6.39/arch/arm/boot/zImage -initrd linux-2.6.39/arch/arm/boot/rootfs -append "root=/dev/ram rdinit=/pai" -s -S &
arm-none-linux-gnueabi-gdb linux-2.6.39/vmlinux
