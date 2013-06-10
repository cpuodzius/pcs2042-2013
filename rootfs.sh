mkdir boot
cp -r bin/* boot
cd boot
find . -depth -print | cpio -o --format=newc > rootfs
find . -depth -print
mv rootfs ~/Public/Poli/3_MA/SO/projeto/linux-2.6.34.14/arch/arm/boot
cd ..
rm -r boot
